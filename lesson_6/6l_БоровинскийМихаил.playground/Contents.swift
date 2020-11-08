import UIKit

struct Queue<T> {
    
    private var elements: [T] = []
    
    mutating func pop() -> T? {
        guard elements.count > 0 else {
            return nil
        }
        return elements.removeFirst()
    }
    
    mutating func push(element: T) {
        elements.append(element)
    }
    
    mutating func groupingEvenInts () -> [T] {
        if elements is [Int] {
        return  elements.filter { $0 as! Int % 2 == 0 }
        }
        else {
            print ("Тип данных Array: \(elements) не соответствует Int")
        }
        return [T]()
    }
    
    mutating func makeStringArray () -> [String] {
            return elements.map{ "\($0)"}
    }
    

    subscript(index: Int) -> T? {
        guard elements.count > 0 , index >= 0, index < elements.count else {
            print ("элемент c индексом \(index) отсутствует в Array")
            return nil
        }
        print ("элемент \(elements[index]) содержится в Array c индексом \(index)")
        return elements[index]
    }
    
}

var example = Queue<Int>()
var example2 = Queue<String>()


example.push(element: 11)
example.push(element: 12)
example.push(element: 13)
example.push(element: 14)
example.groupingEvenInts() // [12, 14]
example.makeStringArray() // ["11", "12", "13", "14"]
example[1] // 12 , print: элемент 12 содержится в Array c индексом 1
example[6] // nil , print: элемент c индексом 6 отсутствует в Array
example.pop() // 11
example.pop() // 12
example.pop() // 13
example.makeStringArray() // ["14"]


example2.push(element: "First")
example2.push(element: "Second")
example2.push(element: "Third")
example2.push(element: "Fourth")
example2.groupingEvenInts() // []
example2.makeStringArray() // ["First", "Second", "Third", "Fourth"]
