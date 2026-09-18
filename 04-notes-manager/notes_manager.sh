#!/bin/bash
echo "===== Notes Manager ====="
while true
do
echo
echo "1. Add Note"
echo "2. View Notes"
echo "3. Search Note"
echo "4. Delete Note"
echo "5. Exit"
read -p "Enter your choice: " choice
echo
case "$choice" in
1)
    read -p "Enter your note: " note
    echo "$note" >> notes.txt
    echo "Note added successfully!"
    ;;
2)
    if [ -s notes.txt ]; then
        cat notes.txt
    else
        echo "No notes found."
    fi
    ;;
3)
    read -p "Enter keyword to search: " keyword
    grep -i --color=always "$keyword" notes.txt
    ;;
4)
    read -p "Enter keyword of note to delete: " keyword

    if grep -qi "$keyword" notes.txt; then
        echo
        echo "Deleted keyword: $keyword"

        sed -i "s/$keyword//Ig" notes.txt

        echo
        echo "Remaining notes:"
        cat notes.txt
    else
        echo "No note found with that keyword."
    fi
    ;;
5)
    echo "Goodbye! 👋"
    break
    ;;
*)
    echo "Invalid choice! Please select 1-5."
    ;;
esac
done

