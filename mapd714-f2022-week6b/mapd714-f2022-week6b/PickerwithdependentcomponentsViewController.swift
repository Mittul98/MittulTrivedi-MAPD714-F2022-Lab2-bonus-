//
//  PickerwithdependentcomponentsViewController.swift
//  mapd714-f2022-week6b
//
//  Created by Mittul Trivedi on 2022-10-23.
//

import UIKit

class PickerwithdependentcomponentsViewController: UIViewController {
    
    private let stateComponent = 0
    private let zipComponent = 1
    private var stateZips:[String : [String]]!
    private var states:[String]!
    private var zips:[String]!
    
    
    @IBOutlet weak var dependentPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Picker with dependent components View Controller")
        
        let bundle = Bundle.main
        let plistURL = bundle.url(forResource:"statedictionary",
                                             withExtension: "plist")
        stateZips = NSDictionary.init(contentsOf: (plistURL)!) as? [String : [String]]
        let allStates = stateZips.keys
        states = allStates.sorted()
        let selectedState = states[0]
        zips = stateZips[selectedState]
    }
    
    @IBAction func onbuttonpressed(_ sender: Any) {
        
        let stateRow =
            dependentPicker.selectedRow(inComponent: stateComponent)
        let zipRow =
            dependentPicker.selectedRow(inComponent: zipComponent)
        
        let state = states[stateRow]
        let zip = zips[zipRow]
        
        let title = "You selected zip \(zip)"
        let message = "\(zip) is \(state)"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


// MARK:-
// MARK: Picker Data Source Methods
func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == stateComponent {
        return states.count
    } else {
        return zips.count
    }
}
// MARK:-
// MARK: Picker Delegate Methods
func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if component == stateComponent {
        return states[row]
    } else {
        return zips[row]
    }
}

func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if component == stateComponent {
        let selectedState = states[row]
        zips = stateZips[selectedState]
        dependentPicker.reloadComponent(zipComponent)
        dependentPicker.selectRow(0, inComponent: zipComponent,
                                  animated: true)
    }
    
}

func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width
        if component == zipComponent {
            return pickerWidth/3
        } else {
            return 2 * pickerWidth/3
        }
    }



}

        