//
//  SettingsViewController.swift
//  Prework
//
//  Created by Dustin Burda on 1/15/22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var darkSwitch: UISwitch!
    @IBOutlet weak var customTip: UILabel!
    @IBOutlet weak var darkModeLabel: UILabel!
    
    let dataSource = ["$ - Dollar", "£ - Pound", "¥ - Yuan", "€ - Euro", "₹ - Rup"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipSlider.value = 16
        tipLabel.text = String(format: "%.2f%", tipSlider.value)
        darkSwitch.isOn = false
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipAmount = defaults.float(forKey: "currentTip")
        let darkBool = defaults.bool(forKey: "currentDark")
        
        tipSlider.value = tipAmount
        tipLabel.text = String(format:"%.2f%%", tipAmount)
        darkSwitch.isOn = darkBool
        darkSwitchHandler()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let tipAmount: Float = Float(tipSlider.value)
        let darkBool: Bool = darkSwitch.isOn
        let defaults = UserDefaults.standard
        
        defaults.setValue(tipAmount, forKey: "currentTip")
        defaults.setValue(darkBool, forKey: "currentDark")
        defaults.synchronize()
    }
    
    @IBAction func darkSwitch(_ sender: Any) {
        darkSwitchHandler()
    }
 
    func darkSwitchHandler(){
        if darkSwitch.isOn{
            self.view.backgroundColor = UIColor.black
            customTip.textColor = UIColor.white
            tipLabel.textColor = UIColor.white
            darkModeLabel.textColor = UIColor.white
        }
        else{
            self.view.backgroundColor = UIColor.white
            customTip.textColor = UIColor.black
            tipLabel.textColor = UIColor.black
            darkModeLabel.textColor = UIColor.black
        }
    }
    
    @IBAction func changeTip(_ sender: Any) {
        let tipAmount = tipSlider.value
        tipLabel.text = String(format:"%.2f%%", tipAmount)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
