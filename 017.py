#! /usr/bin/env python3

n = 1000
count = 0

ones = [0, 3, 3, 5, 4, 4, 3, 5, 5, 4, 3, 6, 6, 8, 8, 7, 7, 9, 8, 8]
tens = [0, 0, 6, 6, 5, 5, 5, 7, 6, 6]

for i in range(1, n + 1):
    if i < 1000:
        if i >= 100:
            # "n hundred"
            count += ones[i // 100] + 7

            if i % 100 != 0:
                # "and" if number is not multiple of 100
                count += 3

        if 0 < i % 100 < 20:
            # add number of letters for one, two, three, ..., nineteen
            count += ones[i % 100]
        else:
            # twenty, twenty one, ..., ninety nine
            count += ones[i % 10]
            count += tens[(i % 100 - i % 10) // 10]
    else:
        count += ones[i // 1000] + 8

print(count)
