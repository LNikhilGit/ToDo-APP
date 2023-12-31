//
//  MainViewViewModel.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/28/23.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var currentUserId : String = ""
    
    var isSigned : Bool{
        return Auth.auth().currentUser != nil
    }
        private var handler : AuthStateDidChangeListenerHandle?
        init() {
           // trying to signOut to check it is working or not
            //try? Auth.auth().signOut()
            handler = Auth.auth().addStateDidChangeListener {
                [weak self]
                _, user in
                
                DispatchQueue.main.async {
                    self?.currentUserId = user?.uid ?? ""
                }
        }
    }
}

