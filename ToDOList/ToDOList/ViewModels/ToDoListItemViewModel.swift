//
//  ToDoListItemViewModel.swift
//  ToDOList
//
//  Created by Nikhil Lalam on 12/29/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel: ObservableObject{
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid).collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    //@Published var
}
