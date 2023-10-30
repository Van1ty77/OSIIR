#!/bin/bash

# Создаем массив с URL-адресами HTML страниц
urls=("http://www.constitution.ru/10003000/10003000-3.htm" "http://www.constitution.ru/10003000/10003000-4.htm" "http://www.constitution.ru/10003000/10003000-5.htm" "http://www.constitution.ru/10003000/10003000-6.htm" "http://www.constitution.ru/10003000/10003000-7.htm" "http://www.constitution.ru/10003000/10003000-8.htm" "http://www.constitution.ru/10003000/10003000-9.htm" "http://www.constitution.ru/10003000/10003000-10.htm" "http://www.constitution.ru/10003000/10003000-11.htm" "http://www.constitution.ru/10003000/10003000-12.htm")

# Создаем пустой файл для записи результатов
> result.html

# Создаем массив с нужными буквами
letters=("Ю" "р" "т" "а" "е" "в")

# Используем цикл для обработки каждой HTML страницы
for url in "${urls[@]}"
do
    # Получаем содержимое страницы и сохраняем во временный файл
    wget -q "$url" -O temp.html

    # Используем цикл для поиска символов по их кодам в кодировке Windows-1251 и записи количества в файл
    for letter in "${letters[@]}"
    do
        count=$(grep -o -P "\x$(printf "%x" "'$letter")" temp.html | wc -l)
        echo -e "$letter:\n$count\n" >> result.html
    done

    # Удаляем временный файл
    rm temp.html
done