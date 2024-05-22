import kotlin.math.max

class NumberFunctionsRecursion {

    fun numberMultUp(num: Int): Int {
        if (num==0) return 0;
        var nextRes = numberMultUp(num/10)
        return nextRes + num%10
    }

    fun countUnOddLess3Up(num: Int): Int {
        if(num==0){return 0}
        var nextRes = numberMultUp(num/10)
        val temp = num%10
        if ((temp%2!=0)&&(temp>3)) return nextRes+1
        else return nextRes
    }

    fun getLCDUp(a: Int, b: Int): Int =
        if(b==0) a
        else getLCDUp(b,a%b)


    tailrec fun numberMultTail(num: Int, res: Int): Int {
        val temp = res%10;
        return numberMultTail(num/10, res*temp)
    }

    tailrec fun countUnOddLess3Tail(num: Int, res: Int): Int {
        var temp=0;
        if((num%10%2!=0)&&(num%10>3)){
            temp = 1
        }
        return numberMultTail(num/10, temp)
    }

    tailrec fun getLCDTail(a: Int, b: Int, cur: Int): Int {
        if(cur==1) return 1
        else {
            if(a%cur==0&&b%cur==0) return cur
        }
        return getLCDTail(a,b,cur-1)
    }
}
