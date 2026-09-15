#!/bin/bash

echo "===== Student Grade System ====="

read -p "Enter student name: " student_name

if [[ ! "$student_name" =~ ^[A-Za-z][A-Za-z\ ]*$ ]]; then
    echo "Error: Please enter a valid student name."
    exit 1
fi

read -p "Enter marks for Mathematics: " math

if [[ ! "$math" =~ ^[0-9]+$ ]] || [ "$math" -gt 100 ]; then
    echo "Error: Mathematics marks must be between 0 and 100."
    exit 1
fi

read -p "Enter marks for Physics: " physics

if [[ ! "$physics" =~ ^[0-9]+$ ]] || [ "$physics" -gt 100 ]; then
    echo "Error: Physics marks must be between 0 and 100."
    exit 1
fi

read -p "Enter marks for Chemistry: " chemistry

if [[ ! "$chemistry" =~ ^[0-9]+$ ]] || [ "$chemistry" -gt 100 ]; then
    echo "Error: Chemistry marks must be between 0 and 100."
    exit 1
fi

total=$((math + physics + chemistry))

percentage=$(echo "scale=2; $total / 3" | bc)

if (( $(echo "$percentage >= 90" | bc -l) )); then
    grade="A"
elif (( $(echo "$percentage >= 80" | bc -l) )); then
    grade="B"
elif (( $(echo "$percentage >= 70" | bc -l) )); then
    grade="C"
elif (( $(echo "$percentage >= 60" | bc -l) )); then
    grade="D"
else
    grade="F"
fi

if (( $(echo "$percentage >= 40" | bc -l) )) && [ "$math" -ge 33 ] && [ "$physics" -ge 33 ] && [ "$chemistry" -ge 33 ]; then
    status="PASS"
else
    status="FAIL"
fi

echo
echo "===== Result ====="
echo "Student: $student_name"
echo "Mathematics: $math/100"
echo "Physics: $physics/100"
echo "Chemistry: $chemistry/100"
echo "Total: $total/300"
echo "Percentage: $percentage%"
echo "Grade: $grade"
echo "Status: $status"
