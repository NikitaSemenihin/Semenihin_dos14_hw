#!/bin/bash

# Функция, объясняющая принцип работы данного скрипта
usage() {
    echo "    This function must be called with three arguments. 
    The first one should be \"add\" for addition, \"sub\" for subtraction, \"mult\" for multiplication, and \"div\" for division. 
    The second and third arguments must be integers."
    exit 1
}

# Функция сложения
add() {
    echo $(( $2 + $3 ))
}

# Функция вычитания
sub() {
    echo $(( $2 - $3 ))
}

# Функция умножения
mult() {
    echo $(( $2 * $3 ))
}

# Функция деления
div() {
    echo $(( $2 / $3 ))
}

# Основная функция
main() {
    # Проверка на наличие переданных аргументов, при их отсутствии вызов функции usage
    if [[ $# -lt 1 ]]; then
        usage
    fi

    # Конструкция case, для первого аргумента, определяющий вызов необходимой функции и передача ей всех аргументов
    case $1 in
        add) add "$@";;
        sub) sub "$@";;
        mult) mult "$@";;
        div) div "$@";;
    esac
}

# Вызов функции main со всеми аргументами
main "$@"