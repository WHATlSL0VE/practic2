#!/bin/bash

ADDRESS_BOOK_FILE="addressbook.txt"

function add_entry {
    echo "$1 $2" >> "$ADDRESS_BOOK_FILE"
}

function list_entries {
    if [ -s "$ADDRESS_BOOK_FILE" ]; then
        cat "$ADDRESS_BOOK_FILE"
    else
        echo "Addressbook is empty."
    fi
}

function remove_entries {
    grep -v "$1" "$ADDRESS_BOOK_FILE" > temp.txt
    mv temp.txt "$ADDRESS_BOOK_FILE"
}

function clear_address_book {
    > "$ADDRESS_BOOK_FILE"
}

function lookup_entries {
    if [ -s "$ADDRESS_BOOK_FILE" ]; then
        grep "$1" "$ADDRESS_BOOK_FILE" | awk '{print $3}'
    else
        echo "Address book is empty."
    fi
}

case "$1" in
    new)
        add_entry "$2" "$3"
        ;;
    list)
        list_entries
        ;;
    remove)
        remove_entries "$2"
        ;;
    clear)
        clear_address_book
        ;;
    lookup)
        lookup_entries "$2" "$3"
        ;;
    *)
        echo "Неправильна команда. Використання: ./addressbook <command> <arguments>"
        echo "Доступні команди: new, list, remove, clear, lookup"
        ;;
esac
