#!/usr/bin/env python3

import os

tn = [int(0.5 * n * (n + 1)) for n in range(1, 101)]

pwd = os.path.dirname(os.path.realpath(__file__))
fp = os.path.join(pwd, "words.txt")

w = ""
with open(fp, "r") as f:
    w = f.readline()

w = list(map(lambda x: x.strip('"'), w.strip("\r\n").split(",")))
w = list(filter(lambda x: x in tn,
                    map(lambda y: sum(map(lambda x: ord(x) - 64, y)), w)))

print(len(w))
