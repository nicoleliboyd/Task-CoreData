//
//  TaskTabTableViewCell.swift
//  Task-CoreData
//
//  Created by David Boyd on 4/27/21.
//

import UIKit

//MARK: - Protocol
protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTabTableViewCell)
}

class TaskTabTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: TaskCompletionDelegate?
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        delegate?.taskCellButtonTapped(self)
    }
    
    //MARK: - Functions
    
    func updateViews() {

        guard let task = task else {return}
        taskNameLabel.text = task.name
        
        if task.isComplete == true {
            let image = UIImage(systemName: "checkmark.square")
            completionButton.setBackgroundImage(image, for: .normal)
            completionButton.tintColor = .black
        } else {
            let image = UIImage(systemName: "square")
            completionButton.setBackgroundImage(image, for: .normal)
            completionButton.tintColor = .black
        }
    }
}//End of class
