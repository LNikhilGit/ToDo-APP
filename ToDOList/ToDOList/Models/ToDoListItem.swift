//
//  ToDoListItemView.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/28/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{
    let id : String
    let title : String
    let date : TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}

