#!/bin/bash

number() {
    read -rp "Enter youre string for number check: " potencialNumber
    if [[ $potencialNumber =~ (\+375|80)(29|33|44|25)[0-9]{7}$ ]]; then
        echo "$potencialNumber is a number"
    else
        echo "$potencialNumber is not a number"
    fi
}