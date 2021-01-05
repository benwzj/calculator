
import Foundation

struct CalculatorMain {

    private var baseNumber: Double?
    private var secondNumber: Double?
    private var calcSymbol: String?
    
    private func formula (number1: Double?, number2: Double?, calc: String?)-> Double?{
        if let n1 = number1, let n2 = number2, let c = calc {
            switch c {
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            case "-":
                return n1 - n2
            case "+" :
                return n1 + n2
            default:
                return nil
            }
        }else {
            return nil
        }
    }
    
    mutating func runCalcaulator(calc: String, input: Double) -> String?{

        switch calc {
        case "+/-":
            return String (input * -1)
        case "%":
            return String (input * 0.01)
        case "AC":
            baseNumber = nil
            secondNumber = nil
            calcSymbol = nil
            return "0"
        case "÷","×", "+","-":
            if let base = baseNumber {
                if let formulaResult = formula(number1: base, number2: input, calc: calc){
                    baseNumber = formulaResult
                    secondNumber = nil
                    calcSymbol = calc
                    return String(formulaResult)
                }
            }else{
                baseNumber = input
                calcSymbol = calc
            }
        case "=":
            if secondNumber == nil {
                secondNumber = input
            }
            if let formulaResult = formula(number1: baseNumber, number2: secondNumber, calc: calcSymbol){
                baseNumber = formulaResult
                secondNumber = nil
                calcSymbol = nil
                return String(formulaResult)
            }
        default:
            return nil
        }
        return nil
    }
}
