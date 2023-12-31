//
//  RegisterScreenView.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/26/23.
//

import SwiftUI

struct RegisterScreenView: View {
    @StateObject var viewModel = RegisterViewModel()
    var body: some View {
        VStack{
            // Header
            LoginHeaderView(title: "Register", subtitle: "Start Organizing To-Do", angle: -15.0, backgroundColor: .orange)
            
            // Form
                Form{
                    TextField("Full Name", text: $viewModel.name)
                    Group {
                    TextField("Email Address", text: $viewModel.email)
                    SecureField("Password", text: $viewModel.password)
                }.autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                 .autocorrectionDisabled()
                    TDbutton(buttonTitle: "Create Account", buttonBackground: .green) {
                        viewModel.register()
                    }
            }
                .offset(y :-60)
        }
    }
}

#Preview {
    RegisterScreenView()
}

