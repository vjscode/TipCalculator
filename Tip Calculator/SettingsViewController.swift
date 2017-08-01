//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Vijay Sailappan on 7/31/17.
//  Copyright © 2017 Vijay Sailappan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var tipSelectorTextField: UITextField!
    @IBOutlet weak var tipPicker: UIPickerView!
    let tipValues = ["18%", "20%", "25%"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipPicker.delegate = self
        tipSelectorTextField.inputView = tipPicker
        tipSelectorTextField.text = tipValues[getDefaultFromStore()]
        tipPicker.selectRow(getDefaultFromStore(), inComponent: 0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    
    // Sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipValues.count
    }
    
    // This function sets the text of the picker view to the content of the "salutations" array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tipValues[row]
    }
    
    // When user selects an option, this function will set the text of the text field to reflect
    // the selected option.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipSelectorTextField.text = tipValues[row]
        putDefaultToStore(tip: row)
    }
    
    func getDefaultFromStore() -> Int  {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "default_tip")
    }
    
    func putDefaultToStore(tip : Int) {
        let defaults = UserDefaults.standard
        defaults.set(tip, forKey: "default_tip")
        defaults.synchronize()
    }

}
