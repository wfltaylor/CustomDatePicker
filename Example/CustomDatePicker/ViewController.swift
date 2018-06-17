//
//  ViewController.swift
//  CustomDatePicker
//
//  Created by wfltaylor@gmail.com on 04/12/2018.
//  Copyright (c) 2018 wfltaylor@gmail.com. All rights reserved.
//

import UIKit
import CustomDatePicker

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var customDatePicker: CustomDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func distantFuture(_ sender: Any) {
        datePicker.setDate(Date.distantFuture, animated: true)
        customDatePicker.setDate(Date.distantFuture, animated: true)
    }
    @IBAction func today(_ sender: Any) {
        datePicker.setDate(Date(), animated: true)
        customDatePicker.setDate(Date(), animated: true)
    }
    @IBAction func changeFontAndColor(_ sender: Any) {
        customDatePicker.font = UIFont(name: "GillSans-Light", size: 20)!
        customDatePicker.textColor = UIColor.red
    }
    @IBAction func resetFontAndColor(_ sender: Any) {
        customDatePicker.font = UIFont.systemFont(ofSize: 20)
        customDatePicker.textColor = UIColor.black
    }
    
}

