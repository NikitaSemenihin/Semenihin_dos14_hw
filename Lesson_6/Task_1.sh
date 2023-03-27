#!/bin/bash

read -rp "Enter a string: " string   # Предложение ввести строку, а так же запись введённого текста в переменную стринг

echo "${string//' '}"        