#!/bin/bash

url(){
    read -rp "Enter youre string for url check: " potencialUrl
    if [[ $potencialUrl =~ (http:\/\/|https:\/\/).*\.(com|net|ru|by)$|(www\.).*\.(com|net|ru|by)$ ]]; then
        echo "$potencialUrl is an url"
    else
        echo "$potencialUrl is not an url"
    fi    
}
