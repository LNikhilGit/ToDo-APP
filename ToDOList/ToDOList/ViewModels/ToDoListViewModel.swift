//
//  ToDoListViewModel.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/29/23.
//

import Foundation
import FirebaseFirestore
class ToDoListViewModel: ObservableObject {
    @Published var showItemNewview = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String ){
        
        Firestore.firestore()
            .collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
