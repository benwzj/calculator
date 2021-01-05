
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    private var main = CalculatorMain()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("displayLabel cant convert to Double")
        }
        if let calcButt = sender.currentTitle{
            if let text = main.runCalcaulator(calc: calcButt, input: number){
                displayLabel.text = text
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {

        if let numberButt = sender.currentTitle{
            if isFinishedTypingNumber {
                displayLabel.text = numberButt
                isFinishedTypingNumber = false
            }else{
                guard let number = Double(displayLabel.text!) else {
                    fatalError("displayLabel cant convert to Double")
                }
                if numberButt == "." {
                    if number != floor(number){
                        return
                    }
                }
                displayLabel.text?.append(numberButt)
            }
        }
    }
}

