//
//  User.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joinedTime: TimeInterval
}
