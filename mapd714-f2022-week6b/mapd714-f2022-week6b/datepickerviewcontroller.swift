//
//  ViewController.swift
//  mapd714-f2022-week6b
//
//  Created by Mittul Trivedi on 2022-10-19.
//

import UIKit

class datepickerviewcontroller: UIViewController {

    @IBOutlet weak var datepickercontroller: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("date Picker View Controler")
        let date = NSDate()
        datepickercontroller.setDate(date as Date, animated: false)
        // Do any additional setup after loading the view.
    }

    @IBAction func selectButton_Pressed(_ sender: Any)
    {
        print(datepickercontroller.date)
        let date = datepickercontroller.date
                  let message = "The date and time you selected is \(date)"
                  let alert = UIAlertController(
                      title: "Date and Time Selected",
                      message: message,
                      preferredStyle: .alert)
                  let action = UIAlertAction(
                      title: "This current date and time",
                      style: .default,
                      handler: nil)
                  alert.addAction(action)
                  present(alert, animated: true, completion: nil)
        
        
    }
    
}

