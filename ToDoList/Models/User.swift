//
//  User.swift
//  ToDoList
//
//  Created by Monica Behrend on 6/8/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
