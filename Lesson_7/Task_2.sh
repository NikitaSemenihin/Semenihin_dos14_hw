#!/bin/bash

# Функция, объясняющая принцип работы данного скрипта
usage() {
    echo "This function must be called with a string to be turned into an acronym."
    exit 1
}

# Функция, которая заменяет знак - на пробел в строке
# После чего переводит эту строку в массив stringInArray
# Так же добавляет первую букву в верхнем регистре каждого элемента массива stringInArray в строку acronym и выводит её в терминал  
acronymFunc() {
    string=$(echo "${*//-/ }")
    stringInArray=($string)
    for iter in "${stringInArray[@]}"; do
        acronym+=$(echo "${iter}" | cut -c1 | tr '[:lower:]' '[:upper:]')
    done
    echo "$acronym"
}

# Основная функция
main(){
    # Проверка на наличие переданных аргументов, при их отсутствии вызов функции usage
    if [[ $# -lt 1 ]]; then
        usage
    fi
    acronymFunc "$@"
}

# Вызов функции main со всеми аргументами
main "$@"