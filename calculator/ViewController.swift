//
//  ViewController.swift
//  calculator
//
//  Created by Khalid Asad on 2018-05-06.
//  Copyright © 2018 khalidtest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var screenNumbers:Double = 0;
    var oldNum:Double = 0;
    var operatorFlag = false;
    var operation = 0;
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func numbers(sender: UIButton) {
        if (operatorFlag == true){
            outputLabel.text = String(sender.tag-1)
            screenNumbers = Double(outputLabel.text!)!
            operatorFlag = false
        }else{
            outputLabel.text = outputLabel.text! + String(sender.tag-1)
            screenNumbers = Double(outputLabel.text!)!
        }
    }
    
    @IBAction func functions(sender: UIButton) {
        if (outputLabel.text != "" && (sender.tag == 14 || sender.tag == 15 || sender.tag == 16 || sender.tag == 17)){
            
            oldNum = Double(outputLabel.text!)!
            
            if (sender.tag == 14){ // divide
                outputLabel.text = "/"
            }else if (sender.tag == 15){ // multiply
                outputLabel.text = "*"
            }
            else if (sender.tag == 16){ // subtract
                outputLabel.text = "-"
            }
            else if (sender.tag == 17){ // add
                outputLabel.text = "+"
            }
            
            operation = sender.tag
            operatorFlag = true;
        }else if (sender.tag == 11){ // clear
            outputLabel.text = " "
            screenNumbers = 0;
            oldNum = 0;
            operation = 0;
        }else if (sender.tag == 18){ // equals
            if operation == 14{
                outputLabel.text = String(oldNum / screenNumbers)
            }else if (operation == 15){
                outputLabel.text = String(oldNum * screenNumbers)
            }else if (operation == 16){
                outputLabel.text = String(oldNum - screenNumbers)
            }else if (operation == 17){
                outputLabel.text = String(oldNum + screenNumbers)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

