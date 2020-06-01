//
//  ViewController.swift
//  Tippy1
//
//  Created by Judy Liu on 2020-01-23.
//  Copyright © 2020 Judy Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var settings = SettingsStore()
    
    var settingManager = SettingsViewController()
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = settings.defaultTipIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double (billField.text!) ?? 0
        let tipPercent = [0.15, 0.18, 0.2]
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = tip + bill
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
    }
    
    func settingsControlPressed(_ text: Int) {
        tipControl.selectedSegmentIndex = text
    }
    
}
