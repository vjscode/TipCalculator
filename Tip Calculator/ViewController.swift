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
    
    @IBOutlet weak var tipControlContainer: UIView!
    
    let tipPercentages = [0.18, 0.20, 0.25]
    var numCharsBill = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSavedBillAmount()
        showHideTipControls(numChars: numCharsBill)
        tipPercentChooser.selectedSegmentIndex = getDefaultFromStore()
        updateTipAndTotal()
    }
    
    @IBAction func onTapOutside(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func updateTotalBill(_ sender: Any) {
        updateTipAndTotal()
    }

    @IBAction func showTipControls(_ sender: Any) {
        numCharsBill = (bill.text?.characters.count)!
        showHideTipControls(numChars: numCharsBill)
    }
    
    func loadSavedBillAmount() {
        let defaults = UserDefaults.standard
        let billAmount = defaults.integer(forKey: "bill_amount")
        if billAmount >  0 {
            bill.text = "\(billAmount)"
        }
        numCharsBill = (bill.text?.characters.count)!
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
        saveBillAmount()
    }
    
    func showHideTipControlsWithoutAnim(numChars : Int) {
        if numChars > 0 {
            if self.tipControlContainer.isHidden {
                self.tipControlContainer.isHidden = false
            }
        } else {
            if !self.tipControlContainer.isHidden {
                self.tipControlContainer.isHidden = true
            }
        }
    }
    
    func showHideTipControls(numChars : Int) {
        if numChars > 0 {
            if self.tipControlContainer.isHidden {
                showWithAnimation(view: self.tipControlContainer)
            }
        } else {
            if !self.tipControlContainer.isHidden {
                hideWithAnimation(view: self.tipControlContainer)
            }
        }
    }
    
    func hideWithAnimation(view : UIView) {
        UIView.animate(withDuration: 0.5, delay: 0.2, options:
            UIViewAnimationOptions.curveLinear, animations: {
                view.alpha = 0
        }, completion: { finished in
            view.isHidden = true
        })
    }
    
    func showWithAnimation(view : UIView) {
        UIView.animate(withDuration: 0.5, delay: 0.2, options:
            UIViewAnimationOptions.curveLinear, animations: {
                view.alpha = 1
        }, completion: { finished in
            view.isHidden = false
        })
    }
    
    func saveBillAmount() {
        let billAmount = (bill.text?.characters.count)!
        if billAmount > 0 {
            let defaults = UserDefaults.standard
            defaults.set(bill.text, forKey: "bill_amount")
        }
    }
}

