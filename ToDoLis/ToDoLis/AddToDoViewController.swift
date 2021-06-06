//
//  AddToDoViewController.swift
//  ToDoLis
//
//  Created by Mark Cheng on 7/27/20.
//  Copyright © 2020 KWK. All rights reserved.
//
import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    
    var previousToDoTVC = ToDoTableViewController()

    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var switchInput: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
            
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let toDo = ToDoCD (context:context)
    
        toDo.name = descriptionInput.text
        toDo.important = switchInput.isOn
        
        appDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    */

}
