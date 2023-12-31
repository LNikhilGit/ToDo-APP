//
//  LoginViewModel.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/26/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email : String = ""
    @Published var password: String = ""
    
    func login(){
        
        guard validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password){ result,error in
            
            guard error == nil else{
                print("SignIn error :\(error!)")
                return
            }
        }
        
    }
    
    private func validate() -> Bool{

        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        
        guard password.count >= 6 else{
            return false
        }
        
        return true
    }
}

