//
//  ViewController.swift
//  Calculater
//
//  Created by Jorden Wu on 23/04/2017.
//  Copyright © 2017 Jorden Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var userIsTyping = false

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        let setCurrentlyinDisplay = display.text!
        
        if userIsTyping {
            display.text!=setCurrentlyinDisplay+digit
        }
        else {
            display.text!=digit
            userIsTyping = true
        }
        
        
    }
    
    var displayValue:Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    private var brain = calculatorBrain()
    
    @IBAction func performperation(_ sender: UIButton) {
        if userIsTyping {
            brain.setOperand(displayValue)
            userIsTyping = false
        }
        if let mathmeticalSymbol = sender.currentTitle {
            brain.performOperation(mathmeticalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
}


