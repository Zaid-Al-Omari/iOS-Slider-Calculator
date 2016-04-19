//
//  ViewController.swift
//  SliderCalculator
//
//  Created by student on 20/4/16.
//  Copyright © 2016 ISS-MWAD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldPrincipal: UITextField!
    @IBOutlet weak var textFieldNumberOfYears: UITextField!
    @IBOutlet weak var slidderNumberOfYears: UISlider!
    @IBOutlet weak var textFieldInterestRate: UITextField!
    @IBOutlet weak var slidderInterestRate: UISlider!
    
    @IBOutlet weak var labelAmount : UILabel!
    
    
    @IBAction func sliderNumberOfYearsChanghed(sender: AnyObject){
        let valueNumberofYears : Int = Int(slidderNumberOfYears.value)
        textFieldNumberOfYears.text = String(valueNumberofYears)
        self.displayAmount(sender)
    }
    
    @IBAction func sliderInterestRateChanghed(sender: AnyObject){
        let valueInterestRate : Float = Float(slidderInterestRate.value)
        textFieldInterestRate.text = NSString(format: "%.2f", valueInterestRate) as String
        self.displayAmount(sender)
    }


    @IBAction func displayAmount(sender: AnyObject) {
        let principalAmount : Int = Int(textFieldPrincipal.text!)!
        let numberOfYears : Int = Int(textFieldNumberOfYears.text!)!
        let interestRate : Float = NSString(string: textFieldInterestRate.text!).floatValue / 100
        let finalAmount = Double(principalAmount) * pow(Double(1+interestRate), Double(numberOfYears))
        labelAmount.text = NSString(format: "%.2f", finalAmount) as String
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textFieldPrincipal.text = "10000"
        textFieldNumberOfYears.text = "10"
        slidderNumberOfYears.value = 10
        textFieldInterestRate.text = "1"
        slidderInterestRate.value = 1
        
        textFieldPrincipal.delegate = self
        textFieldNumberOfYears.delegate = self
        textFieldInterestRate.delegate = self
        
    }
    
    func textFieldDidEndEditing(textField: UITextField){
        self.displayAmount(textField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

