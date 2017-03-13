//
//  ViewController.swift
//  TipCalculatorDemo
//
//  Created by Mendoza, Alejandro on 3/11/17.
//  Copyright © 2017 Alejandro Mendoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabal: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var currencyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        print("We out here")
        let defaults = UserDefaults.standard
        defaults.set("$", forKey: "currency")
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTap(_ sender: Any) {
        
        print("Hello")
        view.endEditing(true)
    }
    
    
    @IBAction func tipAmountChanged(_ sender: Any) {
        calcTip()
    }

    @IBAction func calculateTip(_ sender: Any) {
        calcTip()
    }
    
    public func calcTip()
    {
        let defaults = UserDefaults.standard
        let currency = defaults.string(forKey: "currency")
        let tipPercentages = [0.10, 0.15, 0.20]
        
        //let bill = billField.text
        if let doubleString = billField.text {
            let bill = Double(doubleString) ?? 0
            let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            let total = bill + tip
            
            tipLabal.text = currency! + String(format: "%0.2f", tip)
            totalLabel.text = currency! + String(format: "%0.2f", total)
            currencyLabel.text = currency!
        } 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        calcTip()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

}

