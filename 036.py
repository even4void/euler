#!/usr/bin/env python3

def is_palindrome(n):
    n = str(n)
    if n == n[::-1]:
        return True
    else:
        return False


n = 1000000
total = 0

for i in range(1, n):
    if is_palindrome(i) and is_palindrome(bin(i).split("b")[1]):
        total += i

print(total)
