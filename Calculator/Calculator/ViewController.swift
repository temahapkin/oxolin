import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var result: UILabel!

    private var numberFromScreen:Double = 0;
    private var firstNum:Double = 0;
    private var mathSign:Bool = false;
    private var operation:Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func digist(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
        
        
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction private func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            
            if sender.tag == 11 { // деление
                 result.text = "/";
            }
            else if sender.tag == 12 { // умножение
                result.text = "*";
            }
            else if sender.tag == 13 { // вычитание
                result.text = "-";
            }
            else if sender.tag == 14 { // сложение
                result.text = "+";
                
            }
            
            operation = sender.tag
            mathSign = true;
        }
        else if sender.tag == 15 { // результат
            if operation == 11 {
                result.text = String(firstNum / numberFromScreen)
            }
        else if operation == 12 {
                result.text = String(firstNum * numberFromScreen)
            }
            else if operation == 13 {
                result.text = String(firstNum - numberFromScreen)
            }
            else if operation == 14 {
                result.text = String(firstNum + numberFromScreen)
            }
        }
        else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            operation = 0
            numberFromScreen = 0
        }
    }
}
