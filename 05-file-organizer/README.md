# File Organizer

A command-line file organization tool built with Bash scripting.

## Features

- Organizes files automatically based on file extension
- Supports Images, Documents, Videos, Audio, and Others
- Creates category folders automatically
- Accepts a user-specified target folder
- Validates whether the target folder exists
- Skips directories and processes regular files only
- Handles unknown file types using the Others category

## Supported File Types

| Category | Extensions |
|----------|------------|
| Images | jpg, jpeg, png, gif |
| Documents | pdf, doc, docx, txt |
| Videos | mp4, mkv, avi |
| Audio | mp3, wav |
| Others | All other file types |

## How to Run

Make the script executable:

chmod +x file_organizer.sh

Run the organizer:

./file_organizer.sh

Enter the folder path when prompted.

## Example

Before:

Downloads/
├── photo.jpg
├── resume.pdf
├── song.mp3
├── movie.mp4
└── data.zip

After:

Downloads/
├── Images/
│   └── photo.jpg
├── Documents/
│   └── resume.pdf
├── Audio/
│   └── song.mp3
├── Videos/
│   └── movie.mp4
└── Others/
    └── data.zip

## Technologies

- Bash
- Linux
- Nano
- Git
- GitHub

## Bash Concepts Practiced

- Variables
- `read`
- `if` conditions
- `for` loops
- `case` statements
- `mkdir`
- `mv`
- `basename`
- File extensions
- File and directory validation
- `.gitignore`

## Learning Outcomes

This project helped me practice Bash automation, file and directory manipulation, loops, conditional logic, pattern matching, and building practical command-line tools.
