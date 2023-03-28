#!/bin/bash

source url.sh
source number.sh
source pass.sh
source email.sh

# Функция, объясняющая принцип работы данного скрипта
usage() {
    echo "    This function must be called with an arguments. 
    He one should be \"url\" for url check, \"number\" for phone number check, \"pass\" for security policy check, and \"email\" for email check."
    exit 1
}

main() {
    # Проверка на наличие переданных аргументов, при их отсутствии вызов функции usage
    if [[ $# -lt 1 ]]; then
        usage
    fi

    case $1 in
        url) url;;
        number) number;;
        pass) pass;;
        email) email;;
    esac
}

main "$@"