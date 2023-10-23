#!/bin/bash

number=$((RANDOM % 100 + 1))

for i in {1..100}; do
    if [ $i -lt $number ]; then
        echo "Число больше." > public_html/page$i.html
    elif [ $i -gt $number ]; then
        echo "Число меньше." > public_html/page$i.html
    else
        echo "Вы угадали!" > public_html/page$i.html
    fi
done

echo "Создано 100 html страниц!"