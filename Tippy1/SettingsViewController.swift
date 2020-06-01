//
//  SettingsViewController.swift
//  Tippy1
//
//  Created by Judy Liu on 2020-06-01.
//  Copyright © 2020 Judy Liu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settings = SettingsStore()
    
    @IBOutlet weak var defaultTipControl:UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        defaultTipControl.selectedSegmentIndex = settings.defaultTipIndex
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onDefaultTipChanged(_ sender: Any) {
        let tipPercent = settings.defaultTipPercents[defaultTipControl.selectedSegmentIndex]
        settings.setDefaultTip(amount: tipPercent)
    }
    

}
