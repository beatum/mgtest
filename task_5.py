# -*- coding: utf-8 -*-

"""
Created on 29.08.2018
@author: Ivan Semernyakov <beatuminflow@gmail.com>
"""

# ------------------------------------------------------------------------------
# Функции сортировки людей по возрасту (sortByAge) и имени (sortByName),
# сортируют массив по именам (в алфавитном порядке) и возрасту (по убыванию).
# Вызываем только sortByAge.
# ------------------------------------------------------------------------------

data = {
    'Алексей': 20,
    'Пётр': 23,
    'Александр': 24,
    'Михаил': 25,
    'Фёдор': 27
}


def sortByAge(data):
    if data:
        age = list(data.values())
        age.sort(reverse=True)
        print('sortByAge', age)
    else:
        print('Sort data by age error')

sortByAge(data)


def sortByName(data):
    if data:
        name = list(data.keys())
        name.sort()
        print('sortByName', name)
    else:
        print('Sort data by name error')


# sortByName(data)
