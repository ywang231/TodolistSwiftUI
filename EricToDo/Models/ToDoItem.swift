//
//  ToDoItem.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import Foundation

struct ToDoItem : Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let creatDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
