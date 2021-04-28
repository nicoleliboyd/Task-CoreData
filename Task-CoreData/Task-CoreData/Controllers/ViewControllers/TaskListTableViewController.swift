//
//  TaskListTableViewController.swift
//  Task-CoreData
//
//  Created by David Boyd on 4/27/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskController.sharedInstance.fetchTasks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    //MARK: - Properties
    var task: Task?

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as? TaskTabTableViewCell else {return UITableViewCell()}

        let task = TaskController.sharedInstance.tasks[indexPath.row]
        cell.task = task
        cell.delegate = self

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "toTaskDetailVC" {
            guard let destinationVC = segue.destination as? TaskDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}

            let task = TaskController.sharedInstance.tasks[indexPath.row]
            destinationVC.task = task
        }
    }
}//End of class

//MARK: - Extensions
extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(_ sender: TaskTabTableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender) else {return}
        
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        TaskController.sharedInstance.isComplete(task: task)
        sender.updateViews()
    }
}
