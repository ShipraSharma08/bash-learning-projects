#!/bin/bash

echo "===== Number Guessing Game ====="
while true
do
echo
echo "Choose Difficulty:"
echo "1. Easy   (1-50, 10 attempts)"
echo "2. Medium (1-100, 7 attempts)"
echo "3. Hard   (1-200, 5 attempts)"

read -p "Enter your choice: " difficulty

case $difficulty in
    1)
        max_number=50
        attempts=10
        ;;
    2)
        max_number=100
        attempts=7
        ;;
    3)
        max_number=200
        attempts=5
        ;;
    *)
        echo "Invalid choice! Please select 1, 2, or 3."
        exit 1
        ;;
esac
total_attempts=$attempts
score=0
number=$((RANDOM % max_number + 1))
while [ "$attempts" -gt 0 ]
do
echo "Attempt: $((total_attempts - attempts + 1))/$total_attempts"
echo "Attempts remaining: $attempts"
read -p "Enter your guess: " guess
if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
    echo "Invalid input! Please enter a number."
    continue
fi
if [ "$guess" -lt 1 ] || [ "$guess" -gt "$max_number" ]; then
    echo "Invalid guess! Please enter a number between 1 and $max_number."
    continue
fi
if [ "$guess" -lt "$number" ]; then
    echo "Too Low!"
elif [ "$guess" -gt "$number" ]; then
    echo "Too High!"
else
    echo "Correct! 🎉"
    score=$((attempts * 100))
    echo "Your score: $score"
    break
fi
attempts=$((attempts - 1))
done
if [ "$attempts" -eq 0 ]; then
    echo "Game Over! 😢"
    echo "The correct number was: $number"
fi
echo
read -p "Play again? (y/n): " play_again
case "$play_again" in
    y|Y)
        continue
        ;;
    n|N)
        echo "Thanks for playing! 👋"
        break
        ;;
    *)
        echo "Invalid choice! Please enter y or n."
        break
        ;;
esac
done
