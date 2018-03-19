// Multiples of 3 and 5
// Problem 1

// If we list all the natural numbers below 10 that are multiples of 3
// or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

// Find the sum of all the multiples of 3 or 5 below 1000.

public class P001 {
    
    int sumToN(int n) {
        return n * (n + 1) / 2;
    }

    int sumMultiplesToN(int n, int m) {
        return m * sumToN(n / m);
    }

    int sumMultiplesOf3And5() {
        return sumMultiplesToN(999, 3) + sumMultiplesToN(999, 5)
            - sumMultiplesToN(999, 15);
    }
    
    public static void main(String[] args) {
        P001 p001 = new P001();
        int solution = p001.sumMultiplesOf3And5();
        assert solution == 233168;
        System.out.println(solution);
    }

}
