# Katas in Ruby

## Purpose

Learn TDD and Emergent Design by Pair Programming on katas.

## Setup

### Prerequisites

#### Required

1. Install rbenv (Ruby version manager) using [rbenv-installer](https://github.com/rbenv/rbenv-installer) (follow link for instructions).
1. Install Ruby: `rbenv install 3.1.0`.
1. Install bundler: `gem install bundler`.

#### Optional

##### VS Code plugins:

- Share code from IDE: [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)
- Run tests from IDE: [vscode-run-rspec-file](https://marketplace.visualstudio.com/items?itemName=Thadeu.vscode-run-rspec-file)

### Environment setup

Install dependencies via Bundler:  
`bundle install`

## Usage

### Run tests

Run RSpec (test suite for Ruby):  
`rspec spec`

### Run a script

Execute via `ruby` command, e.g:  
`ruby app/script.rb`

## Katas

### Greeter

#### Before you start:
* **Try not to read ahead.**
* **Do one task at a time. The trick is to learn to work incrementally.**

This kata demonstrates the problems of static scoped functions and objects.

All tests should always pass, regardless of environment conditions.

1. Write a `Greeter` class with `greet` function that receives a `name` as input and outputs `Hello <name>`. The signature of `greet` should not change throughout the kata. You are allowed to construct `Greeter` object as you please.
2. `greet` trims the input
3. `greet` capitalizes the first letter of the name
4. `greet` returns `Good morning <name>` when the time is 06:00-12:00
5. `greet` returns `Good evening <name>` when the time is 18:00-22:00
6. `greet` returns `Good night <name>` when the time is 22:00-06:00
7. `greet` logs into console each time it is called

### String Calculator
Made popular by [Roy Osherove](http://osherove.com/tdd-kata-1/).

#### Before you start:
* **Try not to read ahead.**
* **Do one task at a time. The trick is to learn to work incrementally.**
* **Make sure you only test for correct inputs. there is no need to test for invalid inputs for this kata**

This kata is one of the simplest and best ways to practice step-by-step fluent tdd, and provides an easy way to get proficient in a language.

Write a method `add` under an object `StringCalculator` that, given a delimited string, returns the sum of the numbers in the string.

1. An empty string returns zero `'' => 0`
2. A single number returns the value `'1' => 1` `'2' => 2`
3. Two numbers, comma delimited, returns the sum `'1,2' => 3` `'10,20' => 30`
4. Two numbers, newline delimited, returns the sum `'1\n2' => 3`
5. Three numbers, delimited either way, returns the sum `'1\n2,3\n4' => 10`
6. Negative numbers throw an exception with the message `'-1,2,-3' => 'negatives not allowed: -1,-3'`

**stop here if you are a beginner. Continue if you can finish the steps so far in less than 30 minutes.**

7. Numbers greater than 1000 are ignored
8. A single char delimiter can be defined on the first line starting with `//` (e.g `//#\n1#2` for a ‘#’ as the delimiter)
9. A multi char delimiter can be defined on the first line starting with `//` (e.g. `//###\n1###2` for ‘###’ as the delimiter)

### Bowling Game
See the original [presentation](http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata).

This kata demonstrates the power of doing tests first, and how up-front design decisions can change
and give way to a simpler implementation by coding iteratively.

Write a `BowlingGame` object with methods `roll(pins)` and `getScore()`.

This will be the game engine which follows the rules of bowling:

* The game consists of 10 frames, in each frame the player has the ability to knock down 10 pins.
* The score for the frame is the total number of pins knocked down + bonuses for `strikes` and `spares`.
* A `spare` is when the player knocks down all 10 pins in 2 tries. The bonus for a spare is the next roll.
* A `strike` is when the player knocks down all 10 pins in 1 try. The bonus is the next 2 rolls.
* In the tenth frame a player who rolls a spare / strike gets an extra roll(s) to complete the frame.
* No more than 3 rolls can be rolled in the 10th frame.

### Roman Numerals Conversion

1. Given an Integer, return as a Roman Numeral
1. Given a Roman Numeral, return as an Integer

### Extending String Calculator
The purpose of this kata is to demonstrate the importance and value of the SOLID principles.

Recommended Prework: Read up on SOLID principles.

Some resources:

- [SOLID Principles in Pictures](https://medium.com/backticks-tildes/the-s-o-l-i-d-principles-in-pictures-b34ce2f1e898)

- [SOLID: The First 5 Principles of OOP (examples in PHP)](https://www.digitalocean.com/community/conceptual_articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design)

The Kata: Extend string calculator so that it:

1. can add roman numerals
1. can return the result in roman numerals, specified by a command in the string input
1. remembers and adds to a running total
1. can reset the running total, specified by a command in the string input
1. validates input to avoid unexpected behaviour

## Links

- [Old tdd-katas repository in JavaScript](https://github.com/connected-psobocinski/tdd-katas)
- [Dave Thomas' Code katas](http://codekata.com/)
