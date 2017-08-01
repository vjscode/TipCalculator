//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Vijay Sailappan on 7/29/17.
//  Copyright © 2017 Vijay Sailappan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tipField: UILabel!
    @IBOutlet weak var bill: UITextField!
    @IBOutlet weak var tipPercentChooser: UISegmentedControl!
    let tipPercentages = [0.18, 0.20, 0.25]
    
    override func viewWillAppear(_ animated: Bool) {
        tipPercentChooser.selectedSegmentIndex = getDefaultFromStore()
        updateTipAndTotal()
    }
    
    @IBAction func onTapOutside(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func updateTotalBill(_ sender: Any) {
        updateTipAndTotal()
    }
    
    func getDefaultFromStore() -> Int  {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "default_tip")
    }
    
    func updateTipAndTotal() {
        let bill = Double(self.bill.text!) ?? 0
        let tip = bill * self.tipPercentages[tipPercentChooser.selectedSegmentIndex]
        let total = bill + tip
        self.tipField.text = "$\(tip)"
        self.total.text = "$\(total)"
    }
}

