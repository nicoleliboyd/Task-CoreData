//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by David Boyd on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //MARK: - Ouelets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty,
              let notes = taskNotesTextView.text, !notes.isEmpty else {return}
        
        if let task = task {
            task.name = name
            task.notes = notes
            task.dueDate = taskDueDatePicker.date
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, dueDate: taskDueDatePicker.date)
        } else {
            TaskController.sharedInstance.createTaskWith(name: name, notes: notes, dueDate: taskDueDatePicker.date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        let date = taskDueDatePicker.date
        task?.dueDate = date
    }
    
    //MARK: - Functions
    func updateView() {
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }

}//End of class
