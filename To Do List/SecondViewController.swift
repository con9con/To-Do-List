//
//  SecondViewController.swift
//  To Do List
//
//  Created by Condrec Reese on 1/7/17.
//  Copyright © 2017 Condrec Reese. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    
    
    @IBAction func addTask(_ sender: Any) {
        let tasksObject = UserDefaults.standard.object(forKey: "tasks")
        var tasks: [String]
        if let tempTasks = tasksObject as? [String] {
            tasks = tempTasks
            tasks.append(itemTextField.text!)
        } else {
            tasks = [itemTextField.text!]
        }
        
        UserDefaults.standard.set(tasks, forKey: "tasks")
        itemTextField.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

