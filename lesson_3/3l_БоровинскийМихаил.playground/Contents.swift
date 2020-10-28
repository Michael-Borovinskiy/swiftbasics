import Foundation

struct SportCar {
    let brand: SportCarBrands
    let productionDate: String
    let trunkCapacity: Double
    var isEngineStart = EngineStarter.Off
    var isWindowOpen = WindowOpen.Off
    var trunkFullCapacity: Double {
        get{
            print("После загрузки багажа остаточная вместимость: \((round(trunkCapacity/4)*1000)/1000)")
            return trunkCapacity/4
        }
    }
        
    init(brand: SportCarBrands, productionDate:String, trunkCapacity:Double){
        self.brand = brand
        self.productionDate = productionDate
        self.trunkCapacity = trunkCapacity
    }
    
    init(brand: SportCarBrands, productionDate:String, trunkCapacity:Double, isEngineStart:EngineStarter, isWindowOpen: WindowOpen){
        self.brand = brand
        self.productionDate = productionDate
        self.trunkCapacity = trunkCapacity
        self.isEngineStart = isEngineStart
        self.isWindowOpen = isWindowOpen
        
    }
    
    mutating func switchEngine (){
        if(isEngineStart.self == .Off) {
            isEngineStart.self = .On
            print("мотор включен в методе switchEngine")
        } else {
            isEngineStart.self = .Off
            print("мотор выключен в методе switchEngine")
        }
    }
    
}

struct Truck {
    let brand: TruckBrands
    let productionDate: String
    let trunkCapacity: Double
    var isEngineStart = EngineStarter.Off
    var isWindowOpen =  WindowOpen.Off
    var trunkFullCapacity: Double {
        get{
            print("После загрузки багажа остаточная вместимость: \((round(trunkCapacity/3)*1000)/1000)")
            return trunkCapacity/3
        }
    }
    
    init(brand: TruckBrands, productionDate:String, trunkCapacity:Double){
        self.brand = brand
        self.productionDate = productionDate
        self.trunkCapacity = trunkCapacity
    }
    
    
    init(brand: TruckBrands, productionDate:String, trunkCapacity:Double, isEngineStart:EngineStarter, isWindowOpen: WindowOpen){
        self.brand = brand
        self.productionDate = productionDate
        self.trunkCapacity = trunkCapacity
        self.isEngineStart = isEngineStart
        self.isWindowOpen = isWindowOpen
        
    }
    
}


enum SportCarBrands {
    case Ferrari
    case Lamborhini
    case Porshe
}

enum TruckBrands {
    case Ford
    case Toyota
}


enum EngineStarter {
    case On
    case Off
    
    func inputEngineStarter() {
        switch self {
        case .On:
            print("Поехали")
        default:
            print("Мотор выключен")
        }
    }
}

enum WindowOpen {
    case On
    case Off
    
    func inputWindowOpen() {
        switch self {
        case .On:
            print("Окна открыты")
        default:
            print("Окна закрыты")
        }
    }
}


var sportcar1 = SportCar(brand: .Ferrari, productionDate: "1987", trunkCapacity: 350.0)

var sportcar2 = SportCar(brand: .Lamborhini, productionDate: "2009", trunkCapacity: 0.0)

var truck1 = Truck(brand: .Ford, productionDate: "1999", trunkCapacity: 10000.0, isEngineStart: .On, isWindowOpen: .On)

var truck2 = Truck (brand: .Toyota, productionDate: "2007", trunkCapacity: 12000.0)

var arrayCars = [sportcar1, sportcar2]
var arrayTrucks = [truck1, truck2]

for car in arrayCars {
    print(String(describing: car))
} /*SportCar(brand: __lldb_expr_53.SportCarBrands.Ferrari, productionDate: "1987", trunkCapacity: 350.0, isEngineStart: __lldb_expr_53.EngineStarter.Off, isWindowOpen: __lldb_expr_53.WindowOpen.Off)
 SportCar(brand: __lldb_expr_53.SportCarBrands.Lamborhini, productionDate: "2009", trunkCapacity: 0.0, isEngineStart: __lldb_expr_53.EngineStarter.Off, isWindowOpen: __lldb_expr_53.WindowOpen.Off)*/

for truck in arrayTrucks {
    print(String(describing: truck))
} /*Truck(brand: __lldb_expr_53.TruckBrands.Ford, productionDate: "1999", trunkCapacity: 10000.0, isEngineStart: __lldb_expr_53.EngineStarter.On, isWindowOpen: __lldb_expr_53.WindowOpen.On)
 Truck(brand: __lldb_expr_53.TruckBrands.Toyota, productionDate: "2007", trunkCapacity: 12000.0, isEngineStart: __lldb_expr_53.EngineStarter.Off, isWindowOpen: __lldb_expr_53.WindowOpen.Off)*/


sportcar1.isEngineStart.inputEngineStarter() //Мотор выключен
sportcar1.isEngineStart = EngineStarter.On
sportcar1.isEngineStart.inputEngineStarter() // Поехали

sportcar1.isWindowOpen.inputWindowOpen() // Окна закрыты
sportcar1.isWindowOpen = WindowOpen.On
sportcar1.isWindowOpen.inputWindowOpen() // Окна открыты

sportcar1.trunkFullCapacity // После загрузки багажа остаточная вместимость: 88.0

sportcar1.switchEngine() // мотор выключен в методе switchEngine
sportcar1.switchEngine() // мотор включен в методе switchEngine


truck1.isEngineStart.inputEngineStarter() // Поехали
truck1.isEngineStart = EngineStarter.Off
truck1.isEngineStart.inputEngineStarter() //Мотор выключен

truck1.trunkFullCapacity // После загрузки багажа остаточная вместимость: 3333.0
