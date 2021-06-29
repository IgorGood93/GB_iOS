import Foundation

//  1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

class Car {
    var brand: BrandName
    var color: Color
    var year: Int
    var fuel: EngineFuel
    var dimensions: (Double, Double, Double, Int)? = nil
    var engine: EngineAction
    var wheel: WheelType
    
    enum BrandName: String {
        case VW, BMW, LADA, TOYOTA, LOTUS
    }
    
    enum Color: String {
        case white, black, yellow, blue
    }
    
    enum EngineFuel: String {
        case petrol = "Бензин"
        case diesel = "Дизель"
        case gas = "Газ"
    }
    
    func setDimensions(leight a: Double, width b: Double, height h: Double, weight w: Int) {
        self.dimensions = (a, b, h, w)
    }
    
    enum EngineAction: String {
        case on = "Двигатель запущен"
        case off = "Двигатель остановлен"
    }
    
    func EngineOff() {
        self.engine = .off
        }
    func EngineStart() {
        self.engine = .on
    }
    
    enum WheelType: String {
        case highway = "Шосейная резина"
        case everyday = "Повседневная универсальная"
        case offRoad = "Внедорожная"
    }
    
    func WheelChoiceHW() {
        self.wheel = .highway
        }
    func WheelChoiceED() {
        self.wheel = .everyday
    }
    func WheelChoiceOR() {
        self.wheel = .offRoad
    }
    
    
    init(brand: BrandName, color: Color, year: Int, fuel: EngineFuel, engine: EngineAction, dimensions: (Double, Double, Double, Int), wheel: WheelType) {
        self.brand = brand
        self.color = color
        self.year = year
        self.fuel = fuel
        self.engine = engine
        self.wheel = wheel
        self.setDimensions(leight: dimensions.0, width: dimensions.1, height: dimensions.2, weight: dimensions.3)
    }
}

//  2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//  3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//  4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.


class trunkCar: Car {
    var capacity: CapacityTrunk
    var typeTrunk: BodyTypeTrunk
    var cargoTurn: ActionCargo
    
    enum CapacityTrunk: String {
        case smallest = "1.0 тонник"
        case small = "1.5 тонник"
        case standart = "3.0 тонник"
    }
    
    enum BodyTypeTrunk: String {
        case van = "Фургон"
        case awning = "Тентованный"
        case open = "Открытый кузов"
        case platform = "Платформа"
        case refrigeratior = "Рефрижератор"
        case closedWTailLift = "Закрытый борт с гидролифтом"
    }
    
    enum ActionCargo: String {
        case take = "Кузов разблокирован"
        case takeOff = "Кузов заблокирован"
    }
        
    func CargoTurnOn() {
        self.cargoTurn = .take
        }
    func CargoTurnOff() {
        self.cargoTurn = .takeOff
    }
    
    override func WheelChoiceED() {
        super.WheelChoiceED()
        print("Грузовая резина")
    }
    
    init(brand: BrandName, color: Color, year: Int, fuel: EngineFuel, engine: EngineAction, dimensions: (Double, Double, Double, Int), wheel: WheelType, capacity: CapacityTrunk, typeTrunk: BodyTypeTrunk, cargoTurn: ActionCargo) {
        self.capacity = capacity
        self.typeTrunk = typeTrunk
        self.cargoTurn = cargoTurn
        super.init(brand: brand, color: color, year: year, fuel: fuel, engine: engine, dimensions: dimensions, wheel: wheel)
    }
}


class sporCar: Car {
    var WindowTurn: ActionWindows
    var maxSpeed: Double
    var turbo: Bool
    var power: Double
    
    enum ActionWindows: String {
        case open = "Окна открыты"
        case closed = "Окна закрыты"
    }
    
    func WindowOpen() {
        self.WindowTurn = .open
        }
    func WindowDown() {
        self.WindowTurn = .closed
    }
    
    init(brand: BrandName, color: Color, year: Int, fuel: EngineFuel, engine: EngineAction, dimensions: (Double, Double, Double, Int), wheel: WheelType, WindowTurn: ActionWindows, maxSpeed: Double, turbo: Bool, power: Double) {
        self.WindowTurn = WindowTurn
        self.maxSpeed = maxSpeed
        self.turbo = turbo
        self.power = power
        super.init(brand: brand, color: color, year: year, fuel: fuel, engine: engine, dimensions: dimensions, wheel: wheel)
    }
}

//  5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//  6. Вывести значения свойств экземпляров в консоль.

var car1 = Car(brand: .BMW, color: .black, year: 2020, fuel: .diesel, engine: .off, dimensions: (2170, 1420, 1260, 1460), wheel: .highway)

print(car1.dimensions!)
print(car1.color)

car1.setDimensions(leight: 2150, width: 1960, height: 1120, weight: 1640)
car1.EngineStart()

print(car1.dimensions!)
print(car1.engine)

var trunkCar1 = trunkCar(brand: .TOYOTA, color: .white, year: 2000, fuel: .diesel, engine: .on, dimensions: (2100, 1530, 1640, 2150), wheel: .everyday, capacity: .small, typeTrunk: .refrigeratior, cargoTurn: .take)

print(trunkCar1.capacity)
print(trunkCar1.typeTrunk)

trunkCar1.EngineOff()
print(trunkCar1.engine)


var sportCar1 = sporCar(brand: .VW, color: .blue, year: 2010, fuel: .petrol, engine: .on, dimensions: (1800, 1450, 1200, 1340), wheel: .highway, WindowTurn: .open, maxSpeed: 220, turbo: true, power: 300)

print(sportCar1.turbo)
print(sportCar1.WindowTurn)

