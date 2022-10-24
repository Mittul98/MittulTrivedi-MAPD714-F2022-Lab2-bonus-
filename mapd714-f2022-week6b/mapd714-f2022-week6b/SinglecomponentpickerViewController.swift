//
//  SinglecomponentpickerViewController.swift
//  mapd714-f2022-week6b
//
//  Created by Mittul Trivedi on 2022-10-23.
//

import UIKit

class SinglecomponentpickerViewController: UIViewController,
                                           UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
   
    @IBOutlet weak var singlepicker: UIPickerView!
    private let characterNames = [
            "Mick", "Mark", "Tony Stark", "Mittul", "Lucifer",
            "Jarvis", "Thor"]
   
    
    override func viewDidLoad()
    {

        print("Single Picker")

        // Do any additional setup after loading the view.
    }


    @IBAction func selectButton_Pressed(_ sender: Any) {
        let row = singlepicker.selectedRow(inComponent: 0)
              let selected = characterNames[row]
              let title = "You selected \(selected)!"
              
              let alert = UIAlertController(
                  title: title,
                  message: "You have slected",
                  preferredStyle: .alert)
              let action = UIAlertAction(
                  title: "Bye!!",
                  style: .default,
                  handler: nil)
              alert.addAction(action)
              present(alert, animated: true, completion: nil)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    
    // MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterNames[row]
    }
    

}
