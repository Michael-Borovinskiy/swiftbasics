import Foundation

class Car {
    let productionDate: String?
    var isEngineStart: Bool?
    var isWindowOpen: Bool?
    
    init(productionDate:String, isEngineStart: Bool, isWindowOpen: Bool) {
        self.productionDate = productionDate
        self.isEngineStart = isEngineStart
        self.isWindowOpen = isWindowOpen
    }
    
    func changeWindowPos (action: Action) {
        switch action {
        case .changeWindowPos:
            isWindowOpen = isWindowOpen == true ? false : true
            print("Положение окон открыты =  \(String(describing: isWindowOpen))")
        default:
            print("Выбрано неверное действие")
        }
    }
    
    func engineSwitch(action: Action) {
        switch action {
        case .engineSwitch:
            isEngineStart = isEngineStart == true ? false : true
            print("Мотор включен  =  \(String(describing: isEngineStart))")
        default:
            print("Выбрано неверное действие")
        }
    }
    
}


class SportCar : Car {
    var brand: SportCarBrands?
    var turboEngineStart = true
    var nitro = false
    
    init(brand: SportCarBrands, productionDate:String, isEngineStart: Bool, isWindowOpen: Bool){
        
        super.init(productionDate: productionDate, isEngineStart: isEngineStart, isWindowOpen: isWindowOpen)
        self.brand = brand
    }
    
    
    func useNitro (action: Action) {
        if case .accelerateWithNitro = action {
            nitro = true
            print("nitro activated")
        }
    }
    
    func upgradeSportEngine (action: Action){
        if case .upgradeSportEngine = action {
            turboEngineStart = false
            print("sportEngine upgraded and switched off")
        }
    }

}


class TrunkCar : Car {
    var brand: TrunkBrands?
    var trunkCapacity = 10000.0
    
   init(brand:TrunkBrands, productionDate: String, isEngineStart: Bool, isWindowOpen: Bool) {
        super.init(productionDate: productionDate, isEngineStart: isEngineStart, isWindowOpen: isWindowOpen)
        self.brand = brand
        
    }
    
    func addCargo (action: Action) {
        if case .addCargo(weight: let weight) = action {
            trunkCapacity -= weight
            if (trunkCapacity<=0){
                print("закончилось место, кузов будет освобожден")
                trunkCapacity = 10000.0
            } else {print("загружено \(weight), осталось места под \(trunkCapacity)")}
        }
    }
    
    func takeCargo (action: Action) {
        if case .takeCargo(weight: let weight) = action {
            trunkCapacity += weight
            if (trunkCapacity>=10000){
                print("багажник пуст, весь багаж выдан")
                trunkCapacity = 10000.0
            } else {print("разгружено \(weight), осталось места под \(trunkCapacity)")}
        }
    }
    
    
}

enum Action {
    case accelerateWithNitro
    case upgradeSportEngine
    case addCargo(weight: Double)
    case takeCargo(weight: Double)
    case changeWindowPos
    case engineSwitch
    
}

enum SportCarBrands{
    case Ferrari
    case Lamborhini
    case Porshe
    
}

 enum TrunkBrands{
    case Ford
    case Toyota
}
    

let car = SportCar(brand: .Lamborhini, productionDate: "1999", isEngineStart: true, isWindowOpen: false)
let car2 = SportCar(brand: .Porshe, productionDate: "2020", isEngineStart: false, isWindowOpen: false)

print(car.brand!) // Lamborhini
print(car.productionDate!) // 1999
print(car.isEngineStart!) // true
print(car.isWindowOpen!) // false
print(car.turboEngineStart) // true
car.upgradeSportEngine(action: .upgradeSportEngine) // sportEngine upgraded and switched off
print(car.turboEngineStart) // false
print(car.nitro) // false
car.useNitro(action: .accelerateWithNitro) // nitro activated
print(car.nitro) // true
car.engineSwitch(action: .engineSwitch) // Мотор включен  =  false
print(car.isEngineStart!) // false



print(car2.brand!) // Porshe
print(car2.productionDate!) // 2020
print(car2.isEngineStart!) // false
print(car2.isWindowOpen!) // false
print(car2.turboEngineStart) // true
car2.upgradeSportEngine(action: .upgradeSportEngine) // sportEngine upgraded and switched off
print(car2.turboEngineStart) // false
print(car2.nitro) // false
car2.useNitro(action: .accelerateWithNitro) // nitro activated
print(car2.nitro) // true
car2.engineSwitch(action: .engineSwitch) // Мотор включен  =  true
print(car2.isEngineStart!) // true


let trunk = TrunkCar(brand: .Toyota, productionDate: "2019", isEngineStart: true, isWindowOpen: true)

print(trunk.brand!) // Toyota
print(trunk.productionDate!) // 2019
print(trunk.isEngineStart!) // true
print(trunk.isWindowOpen!) // true
print(trunk.trunkCapacity) // 10000.0


trunk.addCargo(action: .addCargo(weight: 2500.0)) // загружено 2500.0, осталось места под 7500.0
print(trunk.trunkCapacity)   // 7500.0
trunk.addCargo(action: .addCargo(weight: 5000.0)) // загружено 5000.0, осталось места под 2500.0
print(trunk.trunkCapacity) // 2500.0
trunk.takeCargo(action: .takeCargo(weight: 7500.0)) // багажник пуст, весь багаж выдан
print(trunk.trunkCapacity) // 10000.0
trunk.changeWindowPos(action: .changeWindowPos) // Положение окон открыть =  false
print(trunk.isWindowOpen!) // false
trunk.changeWindowPos(action: .changeWindowPos) // Положение окон открыты =  true
print(trunk.isWindowOpen!) // true
