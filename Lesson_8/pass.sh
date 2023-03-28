#!/bin/bash

pass() {
    read -p "Enter youre string for number check: " password
    passLength=${#password}
 
    if [[ "$passLength" -ge 12 ]]; then
        if [[ "$password" =~ [a-z]+ ]]; then
            if [[ "$password" =~ [0-9]+ ]]; then
                if [[ "$password" =~ [\#\$\%\&\-\_\!]+ ]]; then
                    if [[ "$password" =~ [A-Z]+ ]]; then
                        echo "$password is a strong password"
                    else
                        echo "A strong password must be at least 12 characters long including upper and lower case letters special characters and numbersю"
                    fi
                else
                    echo "A strong password must be at least 12 characters long including upper and lower case letters special characters and numbersю"
                fi
            else
                echo "A strong password must be at least 12 characters long including upper and lower case letters special characters and numbersю"
            fi
        else
            echo "A strong password must be at least 12 characters long including upper and lower case letters special characters and numbersю"
        fi
    else
        echo "A strong password must be at least 12 characters long including upper and lower case letters special characters and numbersю"
    fi
}