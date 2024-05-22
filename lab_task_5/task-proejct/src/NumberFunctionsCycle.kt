import kotlin.math.max

class NumberFunctionsCycle {
    fun numberMult(num: Int): Int {
        var number = num;
        var res = 1;
        while (number > 0) {
            res+=num%10;
            number = num/10;
        }
        return res;
    }
    fun countUnOddLess3(num: Int): Int{
        var number = num;
        var res = 0;
        while (number > 0) {
            val temp = number%10;
            if((temp%2!=0)&&(temp>3)){
                res++;
            }
            number = num/10;
        }
        return res;
    }
    fun getLCD(a:Int, b:Int): Int {
        var test = max(a, b)
        do {
            test--;
        } while ((a % test == 0) && (b % test == 0))
        return test
    }


}