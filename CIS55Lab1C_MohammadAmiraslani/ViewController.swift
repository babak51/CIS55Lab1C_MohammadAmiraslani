//
//  ViewController.swift
//  CIS55Lab1C_MohammadAmiraslani
//
//  Created by Mohammad Amiraslani on 10/9/17.
//  Copyright © 2017 Mohammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstDaysPay: UITextField!
    @IBOutlet weak var days: UITextField!
    @IBOutlet weak var payTable: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func create(_ sender: Any) {
        // data validation: checks for empty text fields and none-digit enteries
        switch(Int(firstDaysPay.text!), Int(days.text!)){
        case (nil, nil):
            payTable.text = "Please enter the first day's pay and the number of days as a whole numbers then click the calculate button below."
        case (nil, _):
            payTable.text = "Please add the first day's pay as a whole number then click the 'Calculate' button below."
        case (_, nil):
            payTable.text = "Please add the number of days as a whole number then click the 'Calculate' button below."
        default:
            // the enteries in the text fields have been validated and can be used in calculation
            var myBuffer = ""
            let numberOfDays: Int = Int(days.text!)!
            var dailyPayArray: [Int] = []; var totalPayArray: [Int] = []
            var daysPay: Int = Int(firstDaysPay.text!)!;  var totalPay: Int =  0;
            for n in (0...numberOfDays-1){
                totalPay += daysPay
                dailyPayArray.append(daysPay); totalPayArray.append(totalPay)
                let currencyFormatter = NumberFormatter()
                currencyFormatter.numberStyle = .currency;
                let outputFormat = NSString(format:"On day %d, daily pay earned was %@ and total pay earned was %@\n\n", n + 1, currencyFormatter.string(from: Double(dailyPayArray[n])/100.0 as NSNumber)!, currencyFormatter.string(from: Double(totalPayArray[n])/100.0 as NSNumber)!)
                myBuffer += "\(outputFormat)"
                daysPay *= 2
            }
            payTable.text = myBuffer
        }
        /*
        switch(firstDaysPay.text!, days.text!, Int(firstDaysPay.text!), Int(days.text!)){
        case (_, _, nil, nil):
            payTable.text = "Please enter the first day's pay and the number of days as a whole number then click the calculate button below."
        case (_, _, nil, _):
            payTable.text = "Please add the first day's pay as a whole number then click the 'Calculate' button below."
        case (_, _, _, nil):
            payTable.text = "Please add the number of days as a whole number then click the 'Calculate' button below."
        case ("", "", _, _):
            payTable.text = "Please Enter the first day's pay and the number of the days to calculate, then click the 'Calculate' button below."
        case ("", _, _, _):
            payTable.text = "Please add the first day's pay then click the 'Calculate' button below."
        case (_, "", _, _):
            payTable.text = "Please add the number of days then click the 'Calculate' button below."
        default:
            payTable.text = "ok"
            
        }
        */
        /*
        //let numberOfDaysStr = days.text
        if firstDaysPay!.text!.isEmpty && days.text!.isEmpty{
            payTable.text = "Please Enter the first day's pay and the number of the days to calculate."
            
        }
        else if days.text!.isEmpty{
           payTable.text = "Please Enter the number of days."
        } else if firstDaysPay!.text!.isEmpty(){
           
        }
        //let numberOfDays: Int = Int(numberOfDaysStr!)!
        //let daysPayStr = firstDaysPay.text; let daysPay: Int = Int(daysPayStr!)!
        
        //TODO: insert code
        
        
        payTable.text = String(describing: numberOfDays) + String(describing: daysPay)
        */
    }
    
}

