#!/bin/bash

email() {
    read -rp "Enter youre string for email check: " potencialEmail
    if [[ $potencialEmail =~ .*\@.*\..*$ ]]; then
        echo "$potencialEmail is an email"
    else
        echo "$potencialEmail is not an email"
    fi
}