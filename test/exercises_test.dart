import "dart:io";
import "dart:async";

import "package:test/test.dart";
import "package:yaml/yaml.dart";


/** Helpers */
Future runCmd(String cmd, [List<String> flags]) async {
  var res = await Process.run(cmd, flags ?? [], runInShell: true);

  if (!res.stdout.toString().isEmpty) { stdout.write(res.stdout); };
  if (!res.stderr.toString().isEmpty) { stderr.write(res.stderr); };

  assert(res.exitCode == 0);
}

Future runTest(String path) async {
  final current = Directory.current;

  Directory.current = path;

  final pubspec = new File("pubspec.yaml");

  final packageName = loadYaml(await pubspec.readAsString())["name"];

  print("""
================================================================================
Running tests for: $packageName
================================================================================
""");

  await runCmd("cp lib/${packageName}.dart lib/${packageName}.dart.bu");
  await runCmd("cp test/${packageName}_test.dart test/${packageName}_test.dart.bu");
  try {
    for (var cmd in [
      "cp lib/example.dart lib/${packageName}.dart", // Replace main file with example
      "sed -i -e 's/\\bskip:\\s*true\\b/skip: false/g' test/${packageName}_test.dart", // Enable all tests
      "pub get", // Pull dependecies
      "pub run test" // Run tests
    ]) {
      await runCmd(cmd);
    }
  } finally {
    await runCmd("mv lib/${packageName}.dart.bu lib/${packageName}.dart");
    await runCmd("mv test/${packageName}_test.dart.bu test/${packageName}_test.dart");

    Directory.current = current;
  }
}


void main() {
  test("Exercises", () async {
    final exercisesRootDir = new Directory("exercises");

    assert(await exercisesRootDir.exists());

    final exercisesDirs = exercisesRootDir
      .listSync()
      .where((d) => d is Directory);

    for (var dir in exercisesDirs) {
      await runTest(dir.path);
    }
  });
}
