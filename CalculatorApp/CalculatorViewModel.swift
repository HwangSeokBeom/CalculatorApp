//
//  ViewModel.swift
//  CalculatorApp
//
//  Created by Hwangseokbeom on 11/14/24.
//

import Foundation

class CalculatorViewModel {
    private let model = CalculatorModel()
    private(set) var displayText: String = "0"
    
    func inputNumber(_ number: Int) {
        if displayText == "0" {
            displayText = "\(number)"
        } else {
            displayText += "\(number)"
        }
    }
    
    func inputOperation(_ operation: @escaping (Int, Int) -> Int) {
        if let value = Int(displayText) {
            model.setOperation(operation)
            model.calculate(with: value)
            displayText = "0"
        }
    }
    
    func calculateResult() {
        if let value = Int(displayText) {
            let result = model.calculate(with: value)
            displayText = "\(result)"
        }
    }
    
    func reset() {
        model.reset()
        displayText = "0"
    }
}
