import UIKit

class ViewController: UIViewController {
    private typealias Number = Double
    @IBOutlet private weak var result: UILabel!

    private var firstNum: Number = 0
    private var secontNum: Number = 0
    private var operation: Button.Operation?

    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = "0"
    }
    
    @IBAction private func buttons(_ sender: UIButton) {
        if let button = Button(sender.tag) {
            apply(button)
        }
    }

    private func apply(_ button: Button) {
        let needsUpdateDisplay: Bool
        switch button {
        case .other(let button):
            switch button {
            case .drop:
                result.text = ""
                firstNum = 0
                secontNum = 0
                operation = nil
                needsUpdateDisplay = true
            case .equals:
                if let operation = operation {
                    switch operation {
                    case .division:
                        firstNum /= secontNum
                    case .multiplication:
                        firstNum *= secontNum
                    case .subtraction:
                        firstNum -= secontNum
                    case .summarize:
                        firstNum += secontNum
                    }
                    self.operation = nil
                    secontNum = .zero
                    needsUpdateDisplay = true
                } else {
                    needsUpdateDisplay = false
                }
            }
        case .operation(let operation):
            if let _ = self.operation {
                apply(.other(.equals))
            }

            self.operation = operation
            needsUpdateDisplay = false
        case .numbers(let number):
            if let _ = operation {
                secontNum = secontNum * 10 + Number(number.rawValue)
            } else {
                firstNum = firstNum * 10 + Number(number.rawValue)
            }
            needsUpdateDisplay = true
        }

        if needsUpdateDisplay {
            result.text = String(operation == nil ? firstNum : secontNum)
        }
    }
}
