import Foundation


//  1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//  2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

protocol Car {
    var brandName: String {get} // присваивание бренда
    var colorBody: String {get set} //присваивание цвета кузова
    var productYear: Int {get} //присваивание года выпуска
    var fuelType: String {get} //присваивания типа топлива
    var windowsStatus: Bool {get} //
}

protocol RepairTyre { // объявляем протокол вычисления устаревания покрышек
    var distance: Int {get} // текущий пробег
    var lastRepairDistance: Int {get} // пробег последней смены покрышек
    func TyreRepairDistance()
}

protocol EngineStatus {
    var StatusEngineWork: Bool {get}
    func StatusEngine()
}

struct CustomCar: Car, RepairTyre, EngineStatus {
    let brandName: String
    let productYear: Int
    var colorBody: String
    var distance: Int
    var lastRepairDistance: Int
    var fuelType: String
    var windowsStatus = true
    var StatusEngineWork: Bool
    
    func TyreRepairDistance () {
        if distance - lastRepairDistance >= 20000 {
            print("Требуется замена покрышек")
        } else {
            print("Замена покрышек не требуется")
        }
    }
    
    func StatusEngine() {
        if StatusEngineWork == true {
            print("Двигатель запущен")
        } else {
            print("Двигатель остановлен")
        }
    }
}

var car1 = CustomCar(brandName: "BMW", productYear: 2007, colorBody: "Black", distance: 39000, lastRepairDistance: 10000, fuelType: "petrol", windowsStatus: true, StatusEngineWork: true)

print(car1)
car1.TyreRepairDistance()
car1.lastRepairDistance = 39000
car1.TyreRepairDistance()
car1.StatusEngine()

    // Не понял как и куда внедрить перечисления, что бы они были общие для всех в этом ключе не работают
//  enum BrandName: String {
//      case VW, BMW, LADA, TOYOTA, LOTUS
//  }
//  enum Color: String {
//      case white, black, yellow, blue
//  }
//  enum EngineFuel: String {
//      case petrol = "Бензин"
//      case diesel = "Дизель"
//      case gas = "Газ"
//  }
//

//  enum WheelType: String {
//      case highway = "Шосейная резина"
//      case everyday = "Повседневная универсальная"
//      case offRoad = "Внедорожная"
//      }
//  func WheelChoiceHW() {
//      self.wheel = .highway
//  }
//  func WheelChoiceED() {
//      self.wheel = .everyday
//  }
//  func WheelChoiceOR() {
//      self.wheel = .offRoad
//  }
//

//
//  3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//  4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//  5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//  6. Вывести сами объекты в консоль.

class TrunkCar: Car, CustomStringConvertible {
    var brandName: String = ""
    static var pic = "🛻"
    var colorBody: String = ""
    var fuelType: String = ""
    var productYear: Int = 0
    var windowsStatus: Bool
    var maxVolume: Double
    var loadVolume: Double
    
    func freeVolumeCargo() {
        let freeVolume = maxVolume - loadVolume
        print("Доступно к загрузке \(freeVolume) из \(maxVolume)")
        }
    
    var description: String {
        return "\(TrunkCar.pic) \(brandName). Год выпуска: \(productYear)."
    }
    
    init(brandName: String, productYear: Int, colorBody: String, fuelType: String, windowsStatus: Bool, maxVolume: Double, loadVolume: Double) {
        self.brandName = brandName
        self.productYear = productYear
        self.colorBody = colorBody
        self.fuelType = fuelType
        self.windowsStatus = windowsStatus
        self.maxVolume = maxVolume
        self.loadVolume = loadVolume
    }
}

var SomeTrunkCar = TrunkCar(brandName: "Камаз", productYear: 2001, colorBody: "Белый", fuelType: "diesel", windowsStatus: false, maxVolume: 3000, loadVolume: 1200)

print(SomeTrunkCar)
SomeTrunkCar.freeVolumeCargo()
SomeTrunkCar.brandName = "Маз"
print(SomeTrunkCar)


class SpotrCar: Car, CustomStringConvertible {
    var brandName: String = ""
    static var pic = "🏎"
    var colorBody: String = ""
    var fuelType: String = ""
    var productYear: Int = 0
    var windowsStatus: Bool
    var topSpeed: Int = 0
    var zeroToHundered: Double = 0.0
    
    var description: String {
        return "\(SpotrCar.pic) \(brandName). Год выпуска: \(productYear). Разгон 0-100 км/ч: \(zeroToHundered). Максимальная скорость: \(topSpeed)"
    }
    
    init(brandName: String, productYear: Int, colorBody: String, fuelType: String, windowsStatus: Bool, topSpeed: Int, zeroToHundered: Double) {
        self.brandName = brandName
        self.productYear = productYear
        self.colorBody = colorBody
        self.fuelType = fuelType
        self.windowsStatus = windowsStatus
        self.topSpeed = topSpeed
        self.zeroToHundered = zeroToHundered
    }
}

var SomeSportCar = SpotrCar(brandName: "Лада Калина", productYear: 2019, colorBody: "Желтый", fuelType: "petrol", windowsStatus: true, topSpeed: 320, zeroToHundered: 4.2)

print(SomeSportCar)
print(SomeSportCar.fuelType)

SomeSportCar.zeroToHundered = 3.8
print(SomeSportCar)

