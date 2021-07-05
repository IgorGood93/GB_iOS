import Foundation

//  1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
// 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//  3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue<T> {
    var array: [T] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
        // Добавление элемента в массив очередь
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    // Исключение первого элемента из массива
    mutating func dequeue() -> T? {
        if !array.isEmpty {
            let value = array.removeFirst()
            return value
        }
        return nil
    }
    
    // Получение первого элемента очереди
    mutating func peek() -> T? {
        if !array.isEmpty {
            let value = array.first
            return value
        }
        return nil
    }
    
    // Фильтрация элементов массива
    func filter(array: [T], predicate: (T) -> Bool) -> [T] {
        var tmpArray: [T] = []
            for element in array {
                if predicate(element) {
                    tmpArray.append(element)
                }
            }
            return tmpArray
    }
    
    // возврат nil при обращении к несуществующему индексу
    subscript(indices: UInt ...) -> T? {
        for index in indices where index < self.array.count {
            return self.array[Int(index)]
        }
        return nil
    }
}

var queueInt = Queue<Int>()
var queueStr = Queue<String>()

queueInt.enqueue(1)
queueInt.enqueue(2)
queueInt.enqueue(3)

print(queueInt.array)

print(queueInt.peek()!)

queueInt.dequeue()

print(queueInt.peek()!)
print(queueInt.array)


    // с синтаксисом фильтра пока не получилось разобраться
    
//  queueInt.filter{ $0 % 2 == 0 }

