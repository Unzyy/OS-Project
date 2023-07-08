#!/bin/bash

# Initialize empty arrays to store student and room data
declare -A students
declare -A rooms

# Function to add a new student to the system
function add_student {
    echo "Enter student name:"
    read name
    echo "Enter student ID:"
    read id
    students[$id]="$name"
    echo "Student added successfully"
}

# Function to remove a student from the system
function remove_student {
    echo "Enter student ID:"
    read id
    unset students[$id]
    echo "Student removed successfully"
}

# Function to add a new room to the system
function add_room {
    echo "Enter room number:"
    read room_no
    if [ -n "${rooms[$room_no]}" ]; then
        echo "Room already exists"
    else
        rooms[$room_no]="Vacant"
        echo "Room added successfully"
    fi
}

# Function to assign a room to a student
function assign_room {
    echo "Enter student ID:"
    read id
    if [ -z "${students[$id]}" ]; then
        echo "Student not found"
    else
        echo "Enter room number:"
        read room_no
        if [ -z "${rooms[$room_no]}" ]; then
            echo "Room not found"
        elif [ "${rooms[$room_no]}" != "Vacant" ]; then
            echo "Room is already occupied"
        else
            rooms[$room_no]="$id"
            echo "Room assigned successfully"
        fi
    fi
}

# Function to display room data
function display_room_data {
    for i in "${!rooms[@]}"
    do
        echo "Room number: $i, Occupant: ${rooms[$i]}"
    done
}

# Function to display student data
function display_student_data {
    for i in "${!students[@]}"
    do
        echo "Student ID: $i, Name: ${students[$i]}"
    done
}

# Main menu
while true
do
    echo "Select an option:"
    echo "1. Add student"
    echo "2. Remove student"
    echo "3. Add room"
    echo "4. Assign room to student"
    echo "5. Display room data"
    echo "6. Display student data"
    echo "7. Exit"
    read option
    case $option in
        1) add_student;;
        2) remove_student;;
        3) add_room;;
        4) assign_room;;
        5) display_room_data;;
        6) display_student_data;;
        7) exit;;
        *) echo "Invalid option";;
    esac
done
