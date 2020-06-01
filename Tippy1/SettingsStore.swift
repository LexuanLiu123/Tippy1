//
//  SettingsStore.swift
//  Tippy1
//
//  Created by Judy Liu on 2020-06-01.
//  Copyright © 2020 Judy Liu. All rights reserved.
//

import UIKit

class SettingsStore: NSObject {
    
    private let amountKey = "amount"
    private let defaultTipKey = "default_tip_amount"
    private var defaults = UserDefaults.standard
    
    let defaultTipPercents = [0.15, 0.18, 0.2]
    
    var defaultTipAmount: Double {
        return defaults.double(forKey: defaultTipKey)
    }
    
    var defaultTipIndex: Int {
        let index =  defaultTipPercents.firstIndex(of: defaultTipAmount)
        if index != nil {
            return index ?? Array<Double>.Index(0.0)
        }
        return 0
    }
    
    var billAmount: Double {
        return defaults.double(forKey: amountKey)
    }
    
    func setBillAmount(amount: Double){
        defaults.set(amount, forKey: amountKey)
        defaults.synchronize()
    }
    
    func setDefaultTip(amount: Double){
        defaults.set(amount, forKey: defaultTipKey)
        defaults.synchronize()
    }
    
    func clearValues(){
        setBillAmount(amount: 0)
    }
}
