//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by David Boyd on 4/27/21.
//

import CoreData

extension Task {
    
    @discardableResult convenience init(name: String, notes: String? = nil, dueDate: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init (context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
    }
}//End of extension
