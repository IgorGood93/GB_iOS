import Foundation

//1. Написать функцию, которая определяет, четное число или нет.

func parity(Argument a: Int) -> String {
    a % 2 == 0 ? "\(a) - Четное" : "\(a) - Нечетное"
}

print(parity(Argument: 5))

//
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func remainder(Argument b: Int) -> String {
    b % 3 == 0 ? "\(b) - Делится на 3 без остатка" : "\(b) - Имеет остаток от деления на 3"
}

print(remainder(Argument: 6))

//
//3. Создать возрастающий массив из 100 чисел.

var someInts = [Int]()

for i in (0..<100) {
    someInts.append(i)
}

print(someInts)

//
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

func DelParity(number: Int) -> Bool {
    return number % 2 != 0 && number % 3 != 0
}

var NewSomeInts = Array(someInts).filter(DelParity)

print(NewSomeInts)

//
//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//    Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.


//func FibSeq(_ n: Int) -> Int {
//    if n == 0 {
//        return 0
//    } else if n == 1 || n == 2 {
//        return 1
//    }
//    return FibSeq(n - 1) + FibSeq(n - 2)
//}
//
//print(FibSeq(10))

func FibSeq1(_ number: Int) -> Array<Int> {
    assert(number > 1)
    
    var Array = [0, 1]
    
    while Array.count < number {
        Array.append(Array[Array.count - 1] + Array[Array.count - 2])
    }
    return Array
}

let NewArray = NewSomeInts + FibSeq1(50)

print(NewArray)

//
//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//
//b. Пусть переменная p изначально равна двум — первому простому числу.
//
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//
//e. Повторять шаги c и d, пока возможно.



//func naturalInt(_ n: Int) -> Array<Int> {
//    var ArrayNatural = [Int]()
//    let p = 2
//    for n in (p...n) {
//        ArrayNatural.append(n)
//
//        for p in stride(from: p + 2, through: n, by: p) {
//            print(p)
//        }
//    }
//    return ArrayNatural
//}
//print(naturalInt(10))


