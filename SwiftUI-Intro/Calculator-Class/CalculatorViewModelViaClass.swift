import Foundation
import Combine

class CalculatorViewModelViaClass: ObservableObject {
    enum CalculatorViewModelAction {
        case plus, minus, multiply, equal, divide, clean
    }
    
    let items = [
        ["Clean"],
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "−"],
        [".", "0", "=", "+"]
    ]
    
    var lastAction: CalculatorViewModelAction?
    var shouldCleanTheField: Bool = false

    var currentValue: Decimal = 0
    
     // MARK: The string that detects the change on the class should be marked as @Published
     @Published var bindingString: String = "0"

    // MARK: The string that detects the change on the class should call objectWillChange.send()
    //    var bindingString: String = "0" {
    //        didSet {
    //            objectWillChange.send()
    //        }
    //    }

    init() { }

    func buttonPressed(with title: String) {
        switch title {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
            if shouldCleanTheField {
                bindingString = title
                shouldCleanTheField = false
            } else if bindingString.isEmpty, title == "." {
                bindingString = "0"
            } else if bindingString == "0" {
                bindingString = title
            } else {
                bindingString.append(contentsOf: title)
            }
        case "−":
            shouldCleanTheField = true
            lastAction = .minus
            currentValue = Decimal(string: bindingString) ?? 0
        case "+":
            shouldCleanTheField = true
            lastAction = .plus
            currentValue = Decimal(string: bindingString) ?? 0
        case "*", "×":
            shouldCleanTheField = true
            lastAction = .multiply
            currentValue = Decimal(string: bindingString) ?? 0
        case "=":
            shouldCleanTheField = true
            fillResult()
            lastAction = .equal
        case "÷":
            shouldCleanTheField = true
            lastAction = .divide
            currentValue = Decimal(string: bindingString) ?? 0
        case "Clean":
            shouldCleanTheField = false
            lastAction = nil
            currentValue = 0
            bindingString = "0"
        default: break
        }
    }

    func fillResult() {
        switch lastAction {
        case .plus:
            currentValue = currentValue + (Decimal(string: bindingString) ?? 0)
        case .minus:
            currentValue = currentValue - (Decimal(string: bindingString) ?? 0)
        case .multiply:
            currentValue = currentValue * (Decimal(string: bindingString) ?? 0)
        case .divide:
            currentValue = currentValue / (Decimal(string: bindingString) ?? 0)
        case .none, .equal, .clean:
            return
        }
        bindingString = currentValue.formatted()
    }
}
