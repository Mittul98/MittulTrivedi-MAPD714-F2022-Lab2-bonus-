//
//  MulticomponentpickerViewController.swift
//  mapd714-f2022-week6b
//
//  Created by Mittul Trivedi on 2022-10-19.
//

import UIKit

class MulticomponentpickerViewController: UIViewController,
    UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet weak var multipickercontroller: UIPickerView!
    let Red = ColourChannel.Red
    let Blue = ColourChannel.Blue
    let Green = ColourChannel.Green
    
    var valueArray : [String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("MultiComponentPickerViewController")
        print(Blue)
        buildValueArray()
        
        multipickercontroller.selectRow(255, inComponent: Red.rawValue, animated: true)
        multipickercontroller.selectRow(255, inComponent: Blue.rawValue, animated: true)
        multipickercontroller.selectRow(255, inComponent: Green.rawValue, animated: true)
        
    }
    func buildValueArray()
    {
        for index in stride(from: 255, through: 0, by: -1)
        {
            valueArray.append(String(index))
        }
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 256
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return valueArray[row]
    }
    
    @IBAction func selectButton_Pressed(_ sender: Any)
    {
        let RedChannelIndex = multipickercontroller.selectedRow(inComponent: Red.rawValue)
        let BlueChannelIndex = multipickercontroller.selectedRow(inComponent: Blue.rawValue)
        let GreenChannelIndex = multipickercontroller.selectedRow(inComponent: Green.rawValue)
        
        
        let RedChannel = CGFloat((valueArray[RedChannelIndex] as NSString).floatValue)/255.0
        let BlueChannel = CGFloat((valueArray[BlueChannelIndex] as NSString).floatValue)/255.0
        let GreenChannel = CGFloat((valueArray[GreenChannelIndex] as NSString).floatValue)/255.0
        
        
        let picker = UIColorPickerViewController()
        picker.selectedColor = UIColor(red: RedChannel, green: GreenChannel, blue: BlueChannel, alpha: 1.0)
        
        self.present(picker, animated: true, completion: nil)
    }
}
