
import Foundation

struct CalculatorMain {
    var number: Double?
    var preNumber: Double?
    var calc: String?
    
    mutating func setNumber(_ num: Double){
        if let n = number {
            preNumber = n
            number = num
        }
    }
    
}
