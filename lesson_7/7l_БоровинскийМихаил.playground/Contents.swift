import Foundation

enum ErrorTypes: CustomStringConvertible {
    case doorError
    case nitroError
    
    var description: String {
        switch self {
        case .doorError:
             return "Ошибка количества дверей авто"
        case .nitroError:
            return "Ошибка использования nitro"
        }
    }
}

struct Errors: Error {
    var errorType: ErrorTypes
    var description: String
    var errorCode: Int
    
}

protocol Car {
    
    var productionDate: String{ get }
    var isEngineStart: Bool { get set }
    var isWindowOpen: Bool { get set }
    
    func handleAction (action: Action)
    
}

extension Car {
    
    mutating func changeWindowPos (action: Action) {
        switch action {
        case .changeWindowPos:
            isWindowOpen = isWindowOpen == true ? false : true
            print("Положение окон открыты =  \(String(describing: isWindowOpen))")
        default:
            print("Выбрано неверное действие")
        }
    }
    
    mutating func engineSwitch(action: Action) {
        switch action {
        case .engineSwitch:
            isEngineStart = isEngineStart == true ? false : true
            print("Мотор включен  =  \(String(describing: isEngineStart))")
        default:
            print("Выбрано неверное действие")
        }
    }
}



enum Action {
    case addCargo(weight: Double)
    case takeCargo(weight: Double)
    case changeWindowPos
    case engineSwitch
    case startSportMode
    case loadMode
    case accelerateWithNitro
    
}

enum SportCarBrands : CustomStringConvertible{

    case Ferrari
    case Lamborhini
    case Porshe
    
    var description: String {
        switch self {
            // Use Internationalization, as appropriate.
            case .Ferrari: return "Ferrari"
            case .Lamborhini: return "Lamborhini"
            case .Porshe: return "Porshe"
            }
    }
}

class SportCar : Car, CustomStringConvertible {
    var description: String {
        return "класс SportCar: brand - \(brand!.description), isSportMode - \(isSportMode), productionDate - \(productionDate), isEngineStart - \(isEngineStart), isWindowOpen - \(isWindowOpen), nitro - \(nitro)"
    }
    
    var productionDate: String
    var isEngineStart = false
    var isWindowOpen = false
    
    var brand: SportCarBrands?
    var isSportMode = false
    var nitro = false
    var doors: Int
    
    
    func handleAction(action: Action) {
        switch action {
        case .startSportMode:
            isSportMode.toggle()
        case .accelerateWithNitro:
            if case .accelerateWithNitro = action {
                nitro = true
                print("nitro activated")
            }
        default:
            break
        }
    }
    
    func checkCompatibility () throws -> Bool { //doorsNum doors: Int, useNitro nitro: Bool
        guard doors <= 2 && doors > 0 else {
            throw Errors(errorType: .doorError , description: "Количество дверей =  \(doors) не соответствует спорткару", errorCode: 1)
        }
        guard nitro else {
            throw Errors(errorType: .nitroError, description: "Авто не использует nitro, не допущен до street race", errorCode: 2)
        }
        return true
    }
    
    
    init(productionDate: String, brand: SportCarBrands, doors: Int ) {
        self.brand = brand
        self.productionDate = productionDate
        self.doors  = doors
    }
    
}


var car1 = SportCar(productionDate: "2020", brand: .Ferrari, doors: 2 )

var car2 = SportCar(productionDate: "2019", brand: .Lamborhini, doors: 4)
car2.handleAction(action: .accelerateWithNitro)


do {
    let _ = try car1.checkCompatibility()
} catch{
    print(error) // "Errors(errorType: Ошибка использования nitro, description: "Авто не использует nitro, не допущен до street race", errorCode: 2)\n"
}


do {
    let _ = try car2.checkCompatibility()
} catch{
    print(error) // "Errors(errorType: Ошибка количества дверей авто, description: "Количество дверей =  4 не соответствует спорткару", errorCode: 1)\n"
}





