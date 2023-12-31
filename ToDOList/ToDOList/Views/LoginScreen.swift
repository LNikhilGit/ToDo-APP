//
//  ContentView.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/26/23.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack{
                // Header
                LoginHeaderView(title: "To Do List", subtitle: "Get Things Done!", angle: 15.0, backgroundColor: .green)
                
                // Form
                
                    Form{
                        Group {
                        TextField("Email Address", text: $viewModel.email)
                        SecureField("Password", text: $viewModel.password)
                    }.autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                     .autocorrectionDisabled()
                        TDbutton(buttonTitle: "Login", buttonBackground: .orange) {
                            viewModel.login()
                            //MainViewToDo()
                        }
                }
                .offset(y :-50)
    
                Spacer()
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account") {
                        RegisterScreenView()
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    LoginScreen()
}

