#!/usr/bin/env python3

data = [[int(x) for x in l.split()] for l in open('18.txt').readlines()]

for row in range(len(data)-1, 0, -1):
    for col in range(0, row):
        data[row-1][col] += max(data[row][col], data[row][col+1])

print(data[0][0])
