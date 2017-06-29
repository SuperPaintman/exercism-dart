# Exercism Dart Track

[![Linux Build][travis-image]][travis-url]

<p align="center">
  <a href="https://github.com/SuperPaintman/exercism-dart">
    <img alt="Logo" src="https://raw.githubusercontent.com/SuperPaintman/exercism-dart/master/img/icon.png">
  </a>
</p>

Exercism exercises in Dart


--------------------------------------------------------------------------------


## How to add new exercise

#### 1. Initialize a new exercise

```bash
# "bob" - this is an example slug
# $ ./tool/create-exercise <slug>

$ ./tool/create-exercise bob
```

#### 2. Go to `exercism/<slug>` and edit it

```bash
$ cd exercism/bob

# vim / emacs / code / subl / (other editor)
$ vim .
```


#### 3. Add the exercise to `config.json`

Add the exercise to the `config.json` file, by adding an entry to the exercises
array:

```json
{
  "slug": "dart",
  "language": "Dart",
  "repository": "https://github.com/exercism/dart",
  "active": true,
  "exercises": [
    // ...
    {
      "slug": "bob",
      "difficulty": 1,
      "topics": [
        "Control flow (conditionals)",
        "Polymorfism",
        "Strings",
        "Unicode",
        "Pattern recognition",
        "Regular expressions"
      ]
    },
    // ...
  ],
  // ...
}

```

#### 4. Run tests

```bash
$ pub run test
```


#### 5. Format code

```bash
pub run dart_style:format -l 120 -w .
```


#### 6. Commit and make PR

```bash
$ git checkout -b feature/exercise-bob
$ git commit -am 'Added exercise: bob'
$ git push origin feature/exercise-bob
```


--------------------------------------------------------------------------------


## Code Style

#### Follow the [Dart style guide][dart-style-guide-url]

#### Maximum line length - `120`

#### Exercise dirname in [`kebab-case`][letter-case-url]

```bash
# good
exercises/complex-numbers

# bad
exercises/complex_numbers
exercises/complexNumbers
exercises/complex\ numbers
```

#### Filenames in [`snake_case`][letter-case-url]

```bash
# good
exercises/complex-numbers/lib/complex_numbers.dart
exercises/complex-numbers/test/complex_numbers_test.dart

# bad
exercises/complex-numbers/lib/complex-numbers.dart
exercises/complex-numbers/test/complex-numbers_test.dart

exercises/complex-numbers/lib/complexNumbers.dart
exercises/complex-numbers/test/complexNumbers_test.dart

exercises/complex-numbers/lib/complex\ numbers.dart
exercises/complex-numbers/test/complex\ numbers_test.dart
```

#### Variables / methods / functions in [`camelCase`][letter-case-url]

```dart
// good
void complexNumbers() { }

// bad
void complex_numbers() { }
```

#### Classes in [`PascalCase`][letter-case-url]

```dart
// good
class ComplexNumbers { }

// bad
class complexNumbers { }
class complex_numbers { }
class Complex_numbers { }
```

#### Constatns in [`UPPER_SNAKE_CASE`][letter-case-url]

```dart
// good
const SECRET_ANSWER = 42;

// bad
const secret_answer = 42;
const secretAnswer = 42;
const SecretAnswer = 42;
```


--------------------------------------------------------------------------------


## Contributing

1. Fork it (<https://github.com/SuperPaintman/exercism-dart/fork>)
2. Create your feature branch (`git checkout -b feature/exercise-<slug>`)
3. Commit your changes (`git commit -am 'Added exercise: <slug>'`)
4. Push to the branch (`git push origin feature/exercise-<slug>`)
5. Create a new Pull Request


--------------------------------------------------------------------------------


## Contributors

- [SuperPaintman](https://github.com/SuperPaintman) SuperPaintman - creator, maintainer


--------------------------------------------------------------------------------

## License

[MIT][license-url]


[license-url]: https://github.com/SuperPaintman/exercism-dart/blob/master/LICENSE
[travis-image]: https://img.shields.io/travis/SuperPaintman/exercism-dart/master.svg?label=linux
[travis-url]: https://travis-ci.org/SuperPaintman/exercism-dart
[dart-style-guide-url]: https://www.dartlang.org/guides/language/effective-dart/style
[letter-case-url]: https://en.wikipedia.org/wiki/Letter_case#Special_case_styles
