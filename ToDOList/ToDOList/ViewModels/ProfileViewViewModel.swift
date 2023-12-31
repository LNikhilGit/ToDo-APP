//
//  ProfileViewViewModel.swift
//  ToDOList
//
//  Created by Nikhil Lalam on 12/29/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ProfileViewViewModel: ObservableObject{
    @Published var user: UserRegister?
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        print(uid)
        
        Firestore.firestore().collection("users").document(uid).getDocument{
            [weak self] snapshot,error in
            guard let data = snapshot?.data(),error == nil else{
                print("\(String(describing: error))")
                return
            }
            print(data)
            guard let self = self else{return}
            
            DispatchQueue.main.async {
                self.user = UserRegister(id: data["id"] as? String ?? "",
                                         name: data["name"] as? String ?? "",
                                         email: data["email"] as? String ?? "",
                                         joined: data["joined"] as? TimeInterval ?? 0.0)
            }
            
        }
    }
    
    func logOut(){
        try? Auth.auth().signOut()
    }
}
