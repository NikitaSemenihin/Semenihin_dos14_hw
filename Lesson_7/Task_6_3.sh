#!/bin/bash

# Функция, объясняющая принцип работы данного скрипта
usage() {
    echo "This function must be called with a path to folder with files that should be parsed.(Path must bee without spaces)"
    exit 1
}

# Создаём массив из файлов, находящихся в директории по пути path
createFilesArray() {
    mapfile -t files < <(ls "$1")
}

# Создаём массив extensions, который содержит расширения файлов из массива files
createExtansions() {
    for iter in "${files[@]}"; do
        if [[ $iter =~ .*\..* ]]; then
            extensions+=("${iter#*.}")
        fi
    done
}

# Данная функция удаляет повторяющиеся элементы в массиве extensions
deleteDouble() {
    for((iter=0;iter<"$extensionsArrowLength";iter++)); do
    for((possibleDublicate=iter+1;possibleDublicate<"$extensionsArrowLength";possibleDublicate++)); do
        if [ "${extensions[iter]}" == "${extensions[possibleDublicate]}" ]; then
            unset "extensions[possibleDublicate]"
        fi
    done
done
}

# Данная функция выводит строку, которая озаглавливает каждый тип расширения из массива extensions
echoExtensions() {
for extension in "${extensions[@]}"; do
    echo "Files with $extension extension:"
    # Данный цикл ищет совпадения в названии файлов из массива files с нынешним расширением extension
    # При нахождении выводи его в терминал и удаляет этот элемент
    for ((iter=0;iter<"$filesArrowLength";iter++)); do
        if [[ "${files[iter]}" =~ \.$extension$ ]]; then
            echo "${files[iter]}"
            unset 'files[iter]'
        fi
    done
done
}

# При наличии елементов в массиве files скрипт выводит сообщение а так же оставшиеся файлы
echoFilesWithNoExtension() {
    echo "Files with no extension:"
    for iter in "${files[@]}"; do 
    echo "$iter"
    done
}

# Основная функция
main() {
    # Проверка на наличие переданных аргументов, при их отсутствии вызов функции usage
    if [[ $# -lt 1 ]]; then
        usage
    fi

    createFilesArray "$1"
    createExtansions
    extensionsArrowLength=${#extensions[*]}
    filesArrowLength=${#files[*]}
    deleteDouble
    echoExtensions
    if [[ ${#files[*]} != 0 ]]; then
        echoFilesWithNoExtension
    fi
}

# Вызов функции main со всеми аргументами
main "$@"