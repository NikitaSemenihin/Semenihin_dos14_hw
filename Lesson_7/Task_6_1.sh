#!/bin/bash

# Функция, объясняющая принцип работы данного скрипта
usage() {
    echo "This function must be called with a string to be turned into a string without spaces."
    exit 1
}

# Функция, объеденяющая введённые элементы и выводящая их одной строкой без пробелов
iHateSpaces() {
    for iter in "$@"; do
        string+=$iter
    done
    echo "${string//' '}"    
}

# Основная функция
main() {
    # Проверка на наличие переданных аргументов, при их отсутствии вызов функции usage
    if [[ $# -lt 1 ]]; then
        usage
    fi

    iHateSpaces "$@"
}

# Вызов функции main со всеми аргументами
main "$@"