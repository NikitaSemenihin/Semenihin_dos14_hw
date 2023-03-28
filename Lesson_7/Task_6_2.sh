#!/bin/bash

# Функция, объясняющая принцип работы данного скрипта
usage() {
    echo "This function must be called without any arguments."
    exit 1
}

# Объявление массивов
arr1=("foo" "bar" "blah" "test" "123" "smad" "dasd" "foo")
arr2=("bar" "blah" "test" "1223" "ss" "foo" "dfd")
arr3=()

# Вывод исходных массивов в терминал
echoArrays() {
    echo "${arr1[@]}"
    echo "${arr2[@]}"
}

# Поиск одинаковых элементов в исходных массивах, и добавление их в новый
findEqual() {
    for iterArr1 in "${arr1[@]}"; do
        for iterArr2 in "${arr2[@]}"; do
        if [ "$iterArr1" == "$iterArr2" ]; then
             arr3+=( "$iterArr1" )
        fi
        done
    done
}

# Проверка элементов нового массива на наличие дубликатов, а так же их удаление, в случае нахождения
delDouble() {
    for((iterArr3=0;iterArr3<${#arr3[*]};iterArr3++)); do
    for((possibleDublicate=iterArr3+1;possibleDublicate<${#arr3[*]};possibleDublicate++)); do
        if [ "${arr3[iterArr3]}" == "${arr3[possibleDublicate]}" ]; then
            unset 'arr3[possibleDublicate]'
        fi
    done
    done
}

# Основная функция
main(){
    # Проверка на наличие переданных аргументов, при их наличии вызов функции usage
    if [[ $# != 0 ]]; then
        usage
    fi
    
    echoArrays 
    findEqual 
    delDouble 
    echo "${arr3[@]}"
}

# Вызов функции main со всеми аргументами
main "$@"