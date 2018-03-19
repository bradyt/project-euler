
import csv
from typing import List
import primes

def cache_primes() -> None:
    ps = primes.sieve(10 ** 8)
    with open('primes.csv', 'w') as f:
        writer = csv.writer(f)
        for p in ps:
            writer.writerow([p])

def get_cached_primes() -> List[int]:
    with open('primes.csv', 'r') as f:
        reader = csv.reader(f)
        result = [ line[0] for line in reader ]
        return result

# cache_primes()
print(get_cached_primes())
