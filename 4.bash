#!/bin/bash

# Указываем URL HTML страницы
url="http://www.constitution.ru/10003000/10003000-6.htm"

# Получаем содержимое страницы и сохраняем во временный файл
curl -s "$url" > temp.html

# Создаем массив с нужными буквами
letters=("Ю" "р" "т" "а" "е" "в")

# Используем цикл для поиска слов, начинающихся на каждую букву и записи количества в файл
for letter in "${letters[@]}"
do
    count=$(grep -o "\<$letter\w*\>" temp.html | wc -l)
    echo -e "$letter:\n$count\n" >> constitution.html
done

# Удаляем временный файл
rm temp.html
