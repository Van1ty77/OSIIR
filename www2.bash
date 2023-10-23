#!/bin/bash

number=$((RANDOM % 100 + 1))

for i in {1..100}; do
    if [ $i -lt $number ]; then
        echo "Number is greater." > /home/fit12_31/public_html/page$i.html
    elif [ $i -gt $number ]; then
        echo "Number is less." > /home/fit12_31/public_html/page$i.html
    else
        echo "You guessed right!" > /home/fit12_31/public_html/page$i.html
    fi
done

echo "Создано 100 html страниц!"