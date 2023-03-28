#!/bin/bash

# Выводим запрос директории, в которой будут сортироваться файлы, а так же записываем путь в переменную path
read -rp "Enter a path to the folder: " path

# Создаём массив из файлов, находящихся в директории по пути path
mapfile -t files < <(ls "$path")

# Создаём массив extensions, который содержит расширения файлов из массива files
for iter in "${files[@]}"; do
    if [[ $iter =~ .*\..* ]]; then
        extensions+=("${iter#*.}")
    fi
done

# Записываем длинны массивов rxtensions и files в отдельные переменные, это необходимо для корректной работы циклов
extensionsArrowLength=${#extensions[*]}
filesArrowLength=${#files[*]}

# Данный цикл удаляет повторяющиеся элементы в массиве extensions
for((iter=0;iter<"$extensionsArrowLength";iter++)); do
    for((possibleDublicate=iter+1;possibleDublicate<"$extensionsArrowLength";possibleDublicate++)); do
        if [ "${extensions[iter]}" == "${extensions[possibleDublicate]}" ]; then
            unset "extensions[possibleDublicate]"
        fi
    done
done

# Данный цикл выводит строку, которая озаглавливает каждый тип расширения из массива extensions
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

# Оставшиеся элементы в массиве files будут без расширения
# Так как предыдущий цикл удалил все элементы с расширением
# Здесь проводится проверка на наличие элементов в массиве files
if [[ ${#files[*]} != 0 ]]; then
    # При наличии елементов в массиве files скрипт выводит сообщение а так же оставшиеся файлы
    echo "Files with no extension:"
    for iter in "${files[@]}"; do 
    echo "$iter"
    done
fi