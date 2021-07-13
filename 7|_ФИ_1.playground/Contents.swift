import Foundation



//  1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

//  2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum ErrorList: Error {
    case telecomOper
    case muteOn
    case volumeDanger
    case maxTemperature
    case noName
}

func stopAction() throws {
    if telecomOper {
        throw ErrorList.telecomOper
    }
    
    if muteOn {
        throw ErrorList.muteOn
    }
    
    if volumeDanger {
        throw ErrorList.volumeDanger
    }
    
    if maxTemperature {
        throw ErrorList.maxTemperature
    }
    
    if noName {
        throw ErrorList.noName
    }
}

do {
    try stopAction()
} catch ErrorList.telecomOper {
    print("Оператор связи не установлен")
} catch ErrorList.muteOn {
    print("Активирован бесшумный режим")
} catch ErrorList.volumeDanger {
    print("Опасный уровень громкости")
} catch ErrorList.maxTemperature {
    print("Возможно возгорание АКБ")
} catch ErrorList.noName {
    print("Не знаю такого устройства")
}

struct PhoneStatus {
    var telecom: String
    var volumeSet: UInt
    var temperature: Double
}


class Phone {
    var phoneInfo = [
        "Nokia": PhoneStatus(telecom: "Мегафон", volumeSet: 0, temperature: 40),
        "Samsung": PhoneStatus(telecom: "МТС", volumeSet: 30, temperature: 200),
        "Apple":PhoneStatus(telecom: "Билайн", volumeSet: 60, temperature: 120)
    ]
    
    var volumeSafe = 40
    var temperatureSafe = 120
    
    func phoneSelf(itemNamed name: String, error: String) throws {
        guard let phone = phoneInfo[name] else {
            throw ErrorList.noName
        }
        
        guard phone.telecom != "" else {
            throw ErrorList.telecomOper
        }
        
        guard phone.volumeSet != 0 else {
            throw ErrorList.muteOn
        }
        
        guard phone.volumeSet < 60 else {
            throw ErrorList.volumeDanger
        }
        
        guard phone.temperature <= 120 else {
            throw ErrorList.maxTemperature
        }
        
        print("Устройство \(name) безопасно для использования. Текущие параметры звука установлены на \(volumeSet)%). Ваш оператор сотовой связи: \(telecom)")
    }
}


