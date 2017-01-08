//
//  FirstViewController.swift
//  To Do List
//
//  Created by Condrec Reese on 1/7/17.
//  Copyright © 2017 Condrec Reese. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Properties
    @IBOutlet weak var table: UITableView!

    var tasks: [String] = []
    // Methods
    
    override func viewDidAppear(_ animated: Bool) {
        let tasksObject = UserDefaults.standard.object(forKey: "tasks")
        
        if let tempTasks = tasksObject as? [String] {
            tasks = tempTasks
        }
        
        table.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tasks.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(tasks, forKey: "tasks")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Set up table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
}

