//
//  ViewController.swift
//  PRODCUTNAMEE
//
//  Created by DEVELOPERNAMEE on DATECREATEDD
//  Copyright © 2017 ORGANIZATIONNN All rights reserved.
//

import UIKit
import Lavasa

class ViewController: UIViewController, RFFormListener {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formBuilder = RFBuilder()
        let formJson: String = ""
        formBuilder.generateFormWithString(formJson, formView: self.view, callback: self, customELements: nil, customFields: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onLoad() {
        
    }
    
    func onBeforeFormRender() {
        
    }
    
    func onParseError(_ parseError: String) {
        
        print("Parse error >>> ",parseError)
    }
    
    func onChange(_ jsonData: String) {
        
    }

}

