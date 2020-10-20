import Foundation


//MARK #1
// Решить квадратное уравнение.
// ax^2 + bx + c = 0
print("first task")
print("-----------")
var x1: Double = 0
var x2: Double = 0
var Discr: Double = 0
let a: Double = 2
let b: Double = -7
let c: Double = 6
 
Discr = b * b - 4 * a * c
 
if Discr > 0 {
    x1 = (-b + sqrt(Discr)) / (2 * a)
    x2 = (-b - sqrt(Discr)) / (2 * a)
    print("X1 = \(x1); X2 = \(x2)")
} else if Discr == 0 {
    x1 = (-b + sqrt(Discr)) / (2 * a)
    print("X1 = X2 = \(x1)")
} else {
    print("no valid roots")
}

//MARK #2
//Даны катеты прямоугольного треугольника. Найти
//площадь, периметр и гипотенузу треугольника.
print("")
print("second task")
print("-----------")

let cathetusOne: Float = 10
let cathetusTwo: Float = 6

let squareTriangle = 0.5*cathetusOne*cathetusTwo
let hypotenuse = sqrt((cathetusOne * cathetusOne) + (cathetusTwo * cathetusTwo))
let perimeter = cathetusOne + cathetusTwo + hypotenuse
 
print("squareTriangle = \(squareTriangle), hypotenuse = \(hypotenuse), perimeter = \(perimeter)")

//MARK #3
//Пользователь вводит сумму вклада в банк и годовой процент.
//Найти сумму вклада через 5 лет.
print("")
print("third task")
print("-----------")

let interestRate: Float = 4
var depozit: Float = 1_500_000

for _ in 1...5{
depozit = depozit + (depozit*interestRate/100)
}
print("Сумма вклада через 5 лет = \(depozit)")
