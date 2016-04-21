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
        if userIsTypingANumber {
            enter()
        }
        switch operation {
        case "X":
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() * operandStack.removeLast()
            }
        case "/":
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() / operandStack.removeLast()
            }
//        case "-":
//        case "+":
        default: break
        }
    
    }
    @IBAction func clear() {
        operandStack.removeAll()
        displayValue = 0
        print("operand stack = \(operandStack)")
    }

}

