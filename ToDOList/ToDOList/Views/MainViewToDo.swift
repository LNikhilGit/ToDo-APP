//
//  MainViewToDo.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/28/23.
//

import SwiftUI

struct MainViewToDo: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
// checking if the user is signedIn or not
        if viewModel.isSigned, !viewModel.currentUserId.isEmpty{
            accountView
        }
        else{
            LoginScreen()
        }
    }
        var accountView: some View{
            TabView{
                ToDoListView(userId: viewModel.currentUserId).tabItem {
                    Image(systemName: "house.fill")
                }
                ProfileView().tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
            }
        }
    
}

#Preview {
    MainViewToDo()
}

