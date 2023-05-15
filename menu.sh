#!/bin/bash

# Function to fetch a program from a folder
fetch_program() {
    folder="$1"
    echo "Available programs in $folder folder:"
    ls "$folder" | grep -oE 'q_[0-9]+\.sh' | cut -d'_' -f2 | cut -d'.' -f1
    echo
    read -p "Enter the question number of the program you want to fetch: " question_number
    program="q_${question_number}.sh"
    if [[ -f "$folder/$program" ]]; then
        cp "$folder/$program" .
        chmod +x "$program"
        echo "Program $program fetched successfully."
        run_program "$program"
        rm "$program"
    else
        echo "Program $program not found."
    fi
    echo
    
}



# Function to run a program
run_program() {
    program="$1"
    if [[ -x "$program" ]]; then
        ./"$program"
    else
        echo "Program $program not found or not executable."
    fi
    echo
}

# Main menu loop
while true; do
    echo "MENU:"
    echo "1. Fetch a program from Folder 1"
    echo "2. Fetch a program from Folder 2"
    echo "3. Fetch a program from Folder 3"
    echo "4. Run a program"
    echo "5. Exit"
    echo
    read -p "Enter your choice (1-5): " choice
    echo

    case $choice in
        1)
            fetch_program "Folder1"
            ;;
        2)
            fetch_program "Folder2"
            ;;
        3)
            fetch_program "Folder3"
            ;;
        4)
            run_program
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            echo
            ;;
    esac
done
