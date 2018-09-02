# -*- coding: utf-8 -*-

"""
Created on 29.08.2018
@author: Ivan Semernyakov <beatuminflow@gmail.com>
"""

# ------------------------------------------------------------------------------
# Функия words() принимает аргумент n (по умолчанию равен 0), выводит слово
# товар в нужном склонении: 12 товаров, 22 товара, 1 товар, 0 товаров.
# Аргумент n принимает любое целочисленное значение!
# ------------------------------------------------------------------------------


def words(n=0):
    if n == 0:
        print('{} товарoв'.format(n))
    elif n == 1:
        print('{} товар'.format(n))
    elif 1 < n < 5:
        print('{} товарa'.format(n))
    elif 4 < n < 21:
        print('{} товаров'.format(n))
    elif n >= 21 and n % 10 == 1:
        print('{} товар'.format(n))
    elif n > 21 and n % 10 == 0:
        print('{} товаров'.format(n))
    elif n > 21 and 1 < n % 10 < 5:
        print('{} товара'.format(n))
    else:
        if n > 21 and 4 < n % 10 < 10:
            print('{} товаров'.format(n))
        else:
            print('TypeError')

print('-- Проверка в цикле --')
for i in range(158):
    print(words(i))


