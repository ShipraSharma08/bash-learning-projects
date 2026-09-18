# Number Guessing Game

A command-line number guessing game built with Bash scripting.

## Features

- Random secret number generation
- Three difficulty levels
- Easy: 1-50 with 10 attempts
- Medium: 1-100 with 7 attempts
- Hard: 1-200 with 5 attempts
- Attempt tracking
- Remaining attempts display
- Too High / Too Low hints
- Input validation
- Range validation
- Score calculation
- Game Over handling
- Play Again functionality

## Difficulty Levels

| Difficulty | Number Range | Attempts |
|------------|--------------|----------|
| Easy | 1-50 | 10 |
| Medium | 1-100 | 7 |
| Hard | 1-200 | 5 |

## Scoring

The score is calculated based on the number of attempts remaining.

Score = Remaining Attempts x 100

## How to Run

Make the script executable:

chmod +x guessing_game.sh

Run the game:

./guessing_game.sh

## Technologies

- Bash
- Linux
- Nano
- Git
- GitHub

## Learning Outcomes

This project helped me practice:

- Bash variables
- Random number generation using `$RANDOM`
- Arithmetic expressions
- `if`, `elif`, and `else`
- `while` loops
- `case` statements
- `break` and `continue`
- Regular expressions
- Input validation
- Command-line interaction
- Git and GitHub workflow
