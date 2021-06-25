
import Foundation
//
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

struct SportCar {
    let type: BodyType
    let engine: EngineFuel
    var volume: Double
    let turbo: Bool
    var power: Double
    var torque: Int
    var speed: Int
    var acceleration: Double
    var weight: Double
}

struct TrunkCar {
    let capacity: Capacity
    let typeTrunk: BodyTypeTrunk
    var engine: EngineFuel
}

enum BodyType: String {
    case roadster = "Роадстер"
    case cabrio = "Кабриолет"
    case coupe = "Купе"
}

enum EngineFuel: String {
    case petrol = "Бензин"
    case diesel = "Дизель"
    case gas = "Газ"
}

enum Capacity: String {
    case smallest = "1.0 тонник"
    case small = "1.5 тонник"
    case standart = "3.0 тонник"
    case big = "5.0 тонник"
    case bidest = "10.0 тонник"
}

enum BodyTypeTrunk: String {
    case van = "Фургон"
    case awning = "Тентованный"
    case open = "Открытый кузов"
    case platform = "Платформа"
    case refrigeratior = "Рефрижератор"
    case closedWTailLift = "Закрытый борт с гидролифтом"
}


//
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

struct CarIhfo {
    var brand
    var prodYear: Int
    var volumeTrunk: Double
    var volumeBody: Double
    let engineChek: Action.Action2
    let windowPosition: Action
    var fullTrunkVolume: Double
}


//
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum Action {
    case open, close
    
    enum Action2 {
        case on, off
    }
    enum Action3 {
        case take(cargo: Double), takeOff(cargo: Double)
    }
}



//car1.fullTrunkVolume = Action.Action3.takeOff(cargo: -50)


//
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.



//
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.



//
//6. Вывести значения свойств экземпляров в консоль.
