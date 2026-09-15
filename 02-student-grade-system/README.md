# Student Grade System

A command-line student grade management system built with Bash scripting.

## Features

- Student name input
- Mathematics, Physics, and Chemistry marks input
- Marks validation from 0 to 100
- Student name validation
- Total marks calculation
- Decimal percentage calculation
- Grade calculation from A to F
- PASS/FAIL status
- Minimum 33 marks required in each subject
- Clean result summary
- Error handling for invalid input

## Grade Criteria

- 90% and above → A
- 80% to 89.99% → B
- 70% to 79.99% → C
- 60% to 69.99% → D
- Below 60% → F

## Pass Criteria

A student passes when:

- Overall percentage is at least 40%
- Mathematics marks are at least 33
- Physics marks are at least 33
- Chemistry marks are at least 33

## Technologies

- Bash
- Linux
- bc

## How to Run

Make the script executable:

chmod +x grade_system.sh

Run the program:

./grade_system.sh

## Example

===== Student Grade System =====

Enter student name: Lokesh
Enter marks for Mathematics: 89
Enter marks for Physics: 78
Enter marks for Chemistry: 89

===== Result =====
Student: Lokesh
Mathematics: 89/100
Physics: 78/100
Chemistry: 89/100
Total: 256/300
Percentage: 85.33%
Grade: B
Status: PASS

## Learning Outcomes

This project helped me practice:

- Bash variables
- User input with read
- Conditional statements
- Regular expressions
- Arithmetic operations
- bc for decimal calculations
- if, elif, and else
- Logical operators
- Input validation
- Linux file permissions
- Command-line scripting
