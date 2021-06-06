//
//  ToDoTableViewController.swift
//  ToDoLis
//
//  Created by Mark Cheng on 7/27/20.
//  Copyright © 2020 KWK. All rights reserved.
//
import UIKit

class ToDoTableViewController: UITableViewController {
var listOfToDo : [ToDoCD] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getlistofToDo()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getlistofToDo()
    }
    
    func getlistofToDo () {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDatalistOfToDo = try? context.fetch (ToDoCD.fetchRequest()) as? [ToDoCD] {
                listOfToDo = coreDatalistOfToDo
                tableView.reloadData()
            }
        }
    }
        

    
    // MARK: - Table view data source

    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = listOfToDo[indexPath.row]

        if toDo.important {
            cell.textLabel?.text = "❗️" + (toDo.description )
        } else {
            cell.textLabel?.text = (toDo.description )
        }


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         // this gives us a single ToDo
         let toDo = listOfToDo[indexPath.row]

         performSegue(withIdentifier: "moveToCompletedToDoVC", sender: toDo)
    }

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as? AddToDoViewController {
            nextAddToDoVC.previousToDoTVC = self
        }
        
        if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
                 if let choosenToDo = sender as? ToDoCD {
                      nextCompletedToDoVC.selectedToDo = choosenToDo
                      nextCompletedToDoVC.previousToDoTVC = self
                 }
        }

    }
    

}
