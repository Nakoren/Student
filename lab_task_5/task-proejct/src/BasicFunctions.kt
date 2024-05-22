class Functions {
    fun max(x: Int, y: Int, z: Int): Int {
        if ((x > y) && (x > z)) return x
        if ((y > x) && (y > z)) return y
        return z;
    }

    fun factUp(n: Int): Int {
        if (n == 1) {
            return 1
        };
        else {
            return factUp(n - 1) * n;
        }
    }

    fun factDown(n: Int, cur: Int): Int {
        if (n == 1) {
            return cur;
        } else {
            val temp = cur * n
            return factDown(n - 1, temp)
        }
    }

    fun numSummUp(n: Int): Int {
        if (n == 0) {
            return 0;
        }
        return numSummUp(n / 10) + n % 10;
    }

    fun numSummDown(n: Int, cur: Int): Int {
        if (n == 0) {
            return cur;
        }
        val temp = n % 10;
        return numSummDown(n / 10, cur + temp);
    }

    fun getFun(choice: Boolean): (Int) -> Int {
        if (choice) {
            return ::numSummUp
        } else return ::factUp
    }

    fun countDigits(n: Int, res: Int = 0, function: (Int, Int) -> Int): Int =
        if (n == 0) {
            res
        } else countDigits(n / 10, function(res, n % 10), function)

    fun sum(n: Int): Int = countDigits(n, 0, { a, b -> (a + b) })
    fun mult(n: Int): Int = countDigits(n, 1, { a, b -> (a * b) })

    fun start(){

        val scanner = Scanner(`in`)
        val x: Int = scanner.nextInt()
        val value = 0;
        println(value);
    }
}