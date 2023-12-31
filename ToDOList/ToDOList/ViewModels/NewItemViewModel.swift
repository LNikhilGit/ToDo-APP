//
//  NewItenViewViewModel.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/28/23.
//

import Foundation
import Firebase
import FirebaseFirestore

class NewItemViewModel: ObservableObject{
    
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    var canSaved: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
    
    func save(){
        guard canSaved else{ return}
        
        // Taking current LoggedIn userID
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        // Crete a Model for the ToDOListItem
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   date: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        //Db connection
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid).collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
}

