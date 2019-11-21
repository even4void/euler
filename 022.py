#!/usr/bin/env python3

import os

with open(os.path.dirname(__file__) + "022.txt") as f:
    names = str(f.readlines()[0])
    names = names.replace('"', "").split(",")

names.sort()

score = 0
total = 0

for i, name in enumerate(names):
    for l in name:
        score += ord(l) - 64
    total += (i + 1) * score
    score = 0

print(total)
