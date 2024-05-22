import Functions
import NumberFunctionsCycle
import NumberFunctionsRecursion

fun main() {
    val functionClass = Functions()
    val numCycleClass = NumberFunctionsCycle()
    val numRecursionClass = NumberFunctionsRecursion()

    val temp = functionClass.countDigits(228, 1, functionClass::multNum)
    println(temp)

    var functions = listOf<(Int)->Int>({ a->a+20 }, { a->a*2 }, { a->a/3 } )
    var number = 1
    var res = functions.fold(number){num, func -> func(num)}
    println(res)
}

fun maxNum(n: Int, m: Int): Int = if(n>m) n else n