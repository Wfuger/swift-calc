//
//  ViewController.swift
//  Calculator
//
//  Created by Will Fuger on 4/20/16.
//  Copyright © 2016 boogiesquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsTypingANumber = false
    
    @IBAction func updateDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTypingANumber = true
        }
    }
    
    var operandStack = Array<Double>()
    var operationToDo = Array<String>()
    
    @IBAction func enter() {
        userIsTypingANumber = false
        operandStack.append(displayValue)
        display.text = "0"
        print("operand stack = \(operandStack)")
    }

    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsTypingANumber = false
        }
    }

    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        operationToDo.append(operation)
        print(operationToDo)
        if userIsTypingANumber {
            enter()
        }
        switch operation {
        case "x":
//            if operandStack.count >= 2 {
//                displayValue = operandStack.removeLast() * operandStack.removeLast()
            
                performOperation(multiply)
//            }
        case "/":
                performOperation(divide)
//            if operandStack.count >= 2 {
//                let lastNum = operandStack.removeLast()
//                displayValue = operandStack.removeLast() / lastNum
//            }
        case "-":
                performOperation(subtract)
//            if operandStack.count >= 2 {
//                let secondNum = operandStack.removeLast()
//                displayValue = operandStack.removeLast() - secondNum
//            }
        case "+":
                performOperation(add)
//            if operandStack.count >= 2 {
//                displayValue = operandStack.removeLast() + operandStack.removeLast()
//            }
        default: break
        }
    
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            let lastNum = operandStack.removeLast()
            displayValue = operation(operandStack.removeLast(), lastNum)
            
        }
    }
    func multiply(op1: Double, op2: Double) -> Double {
        return op1 * op2
    }
    func divide(op1: Double, op2: Double) -> Double {
        return op1 / op2
    }
    func subtract(op1: Double, op2: Double) -> Double {
        return op1 - op2
    }
    func add(op1: Double, op2: Double) -> Double {
        return op1 + op2
    }
    @IBAction func clear() {
        operandStack.removeAll()
        display.text = "0"
        print("operand stack = \(operandStack)")
    }

}

