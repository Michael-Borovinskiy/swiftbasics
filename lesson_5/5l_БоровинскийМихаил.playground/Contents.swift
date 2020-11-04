import Foundation

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

 enum TrunkBrands : CustomStringConvertible{
    case Ford
    case Toyota
    
    var description: String {
        switch self {
            // Use Internationalization, as appropriate.
            case .Ford: return "Ford"
            case .Toyota: return "Toyota"
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
    
    init(productionDate: String, brand: SportCarBrands ) {
        self.brand = brand
        self.productionDate = productionDate
    }
    
}

class TrunkCar : Car, CustomStringConvertible {
    var description: String   {
        return "класс TrunkCar: brand - \(brand!.description), isLoadMode - \(isLoadMode), productionDate - \(self.productionDate), isEngineStart - \(isEngineStart), isWindowOpen - \(isWindowOpen), trunkCapacity - \(trunkCapacity)"}
    
    var productionDate: String
    var isEngineStart = false
    var isWindowOpen = false
    
    var brand: TrunkBrands?
    var isLoadMode = false
    var trunkCapacity = 10000.0
    
    func handleAction(action: Action) {
        switch action {
        case .loadMode:
            isLoadMode.toggle()
        case .addCargo (weight: let weight) :
            trunkCapacity -= weight
            if (trunkCapacity<=0){
                    print("закончилось место, кузов будет освобожден")
                    trunkCapacity = 10000.0
                } else {print("загружено \(weight), осталось места под \(trunkCapacity)")}
            
        case .takeCargo(weight: let weight) :
            trunkCapacity += weight
            if (trunkCapacity>=10000){
                print("багажник пуст, весь багаж выдан")
               trunkCapacity = 10000.0
            } else {print("разгружено \(weight), осталось места под \(trunkCapacity)")}
        
         default:
            break
        }
    }
    
    init(productionDate: String, brand: TrunkBrands ) {
        self.brand = brand
        self.productionDate = productionDate
    }

}

var car1 = SportCar(productionDate: "2020", brand: .Ferrari)
var car2 = TrunkCar(productionDate: "2019", brand: .Toyota)
var car3 = TrunkCar(productionDate: "2017", brand: .Ford)

print(car1.description) // класс SportCar: brand - Ferrari, isSportMode - false, productionDate - 2020, isEngineStart - false, isWindowOpen - false, nitro - false
car1.handleAction(action: .startSportMode)
car1.handleAction(action: .accelerateWithNitro)
car1.changeWindowPos(action: .changeWindowPos)
car1.engineSwitch(action: .engineSwitch)
print(car1.description) // класс SportCar: brand - Ferrari, isSportMode - true, productionDate - 2020, isEngineStart - true, isWindowOpen - true, nitro - true

print(car2.description) // класс TrunkCar: brand - Toyota, isLoadMode - false, productionDate - 2019, isEngineStart - false, isWindowOpen - false, trunkCapacity - 10000.0
car2.handleAction(action: .loadMode)
car2.engineSwitch(action: .engineSwitch)
car2.handleAction(action: .addCargo(weight: 20.0))
print(car2.description) // класс TrunkCar: brand - Toyota, isLoadMode - true, productionDate - 2019, isEngineStart - true, isWindowOpen - false, trunkCapacity - 9980.0

print(car3.description) // класс TrunkCar: brand - Ford, isLoadMode - false, productionDate - 2017, isEngineStart - false, isWindowOpen - false, trunkCapacity - 10000.0
car3.handleAction(action: .loadMode)
car3.handleAction(action: .addCargo(weight: 5000.0))
print(car3.description) // класс TrunkCar: brand - Ford, isLoadMode - true, productionDate - 2017, isEngineStart - false, isWindowOpen - false, trunkCapacity - 5000.0
