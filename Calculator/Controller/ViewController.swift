
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    private var displayDouble: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("displayLabel cant convert to Double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true

        if let calc = sender.currentTitle{
            if calc == "+/-" {
                displayDouble = displayDouble * -1
            }else if calc == "%" {
                displayDouble = displayDouble / 100
            }else if calc == "AC" {
                displayDouble = 0
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {

        if let numberPressed = sender.currentTitle{
            if isFinishedTypingNumber {
                displayLabel.text = numberPressed
                isFinishedTypingNumber = false
            }else{
                if numberPressed == "." {
                    if displayDouble != floor(displayDouble){
                        return
                    }
                }
                displayLabel.text?.append(numberPressed)
            }
        }
    }
}

