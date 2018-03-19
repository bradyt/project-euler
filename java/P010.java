#!/usr/bin/python3
// Summation of primes
// Problem 10

// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

// Find the sum of all the primes below two million.

// from https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
// Input: an integer n > 1.
#
// Let A be an array of Boolean values, indexed by integers 2 to n,
// initially all set to true.
#
// for i = 2, 3, 4, ..., not exceeding √n:
//   if A[i] is true:
//     for j = i^2, i^2+i, i^2+^2i, i^2+3i, ..., not exceeding n:
//       A[j] := false.
#
// Output: all i such that A[i] is true.

import primes

def sum_primes(n):
    A = primes.sieve_of_eratosthenes(n)
    return sum([i for i in range(n + 1) if A[i] == True])

def solution():
    return sum_primes(2 * 10 ** 6)

def main():
    print(solution())

if __name__ == '__main__':
    main()
