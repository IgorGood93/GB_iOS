import Foundation

//
//  Created by Игорь Гутчинов on 16.06.2021.
//

// Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет

// Проводим запрос данных - сумму вклада и процентую ставку
print("Введите сумму вклада:")

//var value = Double(readLine(strippingNewline: true)!)!
var value: Double = 1000
let V = value

print("Сумма вклада: \(value)")

print("Введите процентную ставку:")

//var percent = Double(readLine(strippingNewline: true)!)!
var percent: Double = 6.4
print("Годовой процент: \(percent)")

// расчет сложного процента с ежегодной капитализацией
var i = 0
for i in 1...5 {
    value = value  + value * (percent / 100)
    print("В \(i) году капитализация составит:  \(round(value * 100) / 100)")
}
// Вывод общей доходности
print("Ваш доход за 5 лет составит: \(round((value - V) * 100) / 100)")
