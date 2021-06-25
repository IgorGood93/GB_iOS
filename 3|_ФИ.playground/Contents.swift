
import Foundation
//
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

// задаем начальный вид структур
struct SportCar {
    let typeCar: BodyType
    let turbo: Bool
    var power: Double
    var torque: Int
    var speed: Int
    var acceleration: Double
}

struct TrunkCar {
    let capacity: CapacityTrunk
    let typeTrunk: BodyTypeTrunk
    var volumeTrunk: Double
}


// вводим начальные перечисления
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

enum CapacityTrunk: String {
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


// создаем промежуточную типовую структуру
struct CarIhfo {
    var lenght: Double
    var width: Double
    var height: Double
    var weight: Double
    var brand: String
    var prodYear: Int
    let engine: EngineFuel
    var volumeload: Double
    var volumeBody: Double
    var engineChek: ActionEngine
    var windowPosition: ActionWindows
    var fullTrunkVolume: Double
    
    // ответ на 4 вопрос
    mutating func openWindow() {
        self.windowPosition = .open
    }
    
    mutating func closeWindow() {
        self.windowPosition = .close
    }
}

// соединяем две структуры с общей

struct SportCarInfo {
    let SportCar: SportCar
    var CarIhfo: CarIhfo
}

struct TrunkCarInfo {
    var TrunkCar: TrunkCar
    var CarIhfo: CarIhfo
}

//
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum ActionWindows {
    case open, close
}

enum ActionEngine {
    case on, off
}

enum ActionCargo {
    case take(cargo: Double), takeOff( cargo: Double)
}

//
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

// попытался объединить в новую сруктуру с заданием методов изменения аргументов, но не работает. возможно так делать не корректно, но хочется разобраться возможно ли расширение аргументов структур на определенных этапах работ
struct MutatingSportCarInfo {
    var SportCarInfo: SportCarInfo
    
    //    mutating func openWindow() {
    //        self.windowPosition = .open
    //    }
    //
    //    mutating func closeWindow() {
    //        self.windowPosition = .close
    //    }
}

//
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

var SportCar1 = SportCarInfo(SportCar: SportCar(typeCar: .cabrio, turbo: true, power: 600, torque: 5600, speed: 320, acceleration: 4.2), CarIhfo: CarIhfo(lenght: 2860, width: 1840, height: 1180, weight: 1150, brand: "Porshe", prodYear: 2008, engine: .petrol, volumeload: 60, volumeBody: 140, engineChek: .on, windowPosition: .open, fullTrunkVolume: 40))

SportCar1.CarIhfo.engineChek = .off
SportCar1.CarIhfo.windowPosition = .close

var TrunkCar2 = TrunkCarInfo(TrunkCar: TrunkCar(capacity: .small, typeTrunk: .van, volumeTrunk: 120), CarIhfo: CarIhfo(lenght: 2160, width: 1940, height: 1800, weight: 1890, brand: "Mersedes", prodYear: 2004, engine: .diesel, volumeload: 800, volumeBody: 100, engineChek: .off, windowPosition: .close, fullTrunkVolume: 600))
//
//6. Вывести значения свойств экземпляров в консоль.
print(SportCar1)
print(TrunkCar2)

