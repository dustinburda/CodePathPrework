//
//  ViewController.swift
//  Prework
//
//  Created by Dustin Burda on 1/15/22.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partySizeSegment: UIStepper!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var customTip: UILabel!
    @IBOutlet weak var customPerPerson: UILabel!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var partySizeText: UILabel!
    @IBOutlet weak var equalSign: UILabel!
    
    var darkBool: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipSegment.selectedSegmentIndex = 0
        billTextField.keyboardType = .asciiCapableNumberPad
        billTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        
         let defaults = UserDefaults.standard
         let tipAmount = defaults.float(forKey: "currentTip")
         darkBool = defaults.bool(forKey: "currentDark")
         darkSwitchHandler()

         let d_partySize = Float(partySizeSegment.value)
         let bill = Float(billTextField.text!) ?? 0
         let tip = bill * (tipAmount / 100)
         let total = tip + bill

         let totalPerPerson = total / d_partySize
         
        customTip.text = String(format:"$%.2f", total)
        customPerPerson.text = String(format:"$%.2f per person", totalPerPerson)

        }
    
    func darkSwitchHandler(){
        if darkBool{
            self.view.backgroundColor = UIColor.black
            partySizeSegment.layer.cornerRadius = 0
            partySizeSegment.backgroundColor = UIColor.white
            tipSegment.backgroundColor = UIColor.white
            billTextField.textColor = UIColor.white
            tipLabel.textColor = UIColor.white
            tipText.textColor = UIColor.white
            partySizeText.textColor = UIColor.white
            equalSign.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            partySizeLabel.textColor = UIColor.white
            perPersonLabel.textColor = UIColor.white
            customTip.textColor = UIColor.white
            customPerPerson.textColor = UIColor.white
            
            
        }
        else{
            self.view.backgroundColor = UIColor.white
            billTextField.textColor = UIColor.black
            tipLabel.textColor = UIColor.black
            tipText.textColor = UIColor.black
            partySizeText.textColor = UIColor.black
            equalSign.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            partySizeLabel.textColor = UIColor.black
            perPersonLabel.textColor = UIColor.black
            customTip.textColor = UIColor.black
            customPerPerson.textColor = UIColor.black
        }
    }
    
    @IBAction func calcTipBill(_ sender: Any) {
        let partySize = Int(partySizeSegment.value)
        
        let d_partySize = Double(partySizeSegment.value)
        
        let bill = Double(billTextField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipSegment.selectedSegmentIndex]
        let total = tip + bill
        
        let totalPerPerson = total / d_partySize
        
        tipLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format:"$%.2f", total)
        
        perPersonLabel.text = String(format: "$%.2f per person", totalPerPerson)
        
    }
    

    @IBAction func calcTipSegment(_ sender: Any) {
        let partySize = Int(partySizeSegment.value)
        
        let d_partySize = Double(partySizeSegment.value)
        
        let bill = Double(billTextField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipSegment.selectedSegmentIndex]
        let total = tip + bill
        
        let totalPerPerson = total / d_partySize
        
        tipLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format:"$%.2f", total)
        
        perPersonLabel.text = String(format: "$%.2f per person", totalPerPerson)
    }
    
    
    @IBAction func calcTipStepper(_ sender: Any) {
        let partySize = Int(partySizeSegment.value)
        
        let d_partySize = Double(partySizeSegment.value)
        
        let bill = Double(billTextField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipSegment.selectedSegmentIndex]
        let total = tip + bill
        
        let totalPerPerson = total / d_partySize
        
        partySizeText.text = String(partySize)
        
        perPersonLabel.text = String(format: "$%.2f per person", totalPerPerson)
        
    }
    
}

