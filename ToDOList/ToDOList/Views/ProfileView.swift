//
//  ProfileScreen.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/28/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    UserView(viewModel: viewModel)
                }
                else{
                    Text("Loading profile....")
                }
            }.navigationTitle("Profile")
        }
        .onAppear(){
//            print("Screen loaded")
            viewModel.fetchUser()
        }
    }
    
}

struct UserView: View{
    //typealias Body = <#type#>
    @ObservedObject var viewModel: ProfileViewViewModel
    var body: some View{
        VStack{
            
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 150)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .padding()
            
            VStack(alignment: .leading){
                HStack{
                    Text("Name:").bold()
                    Text(viewModel.user?.name ?? "Unknown")
                }
                HStack{
                    Text("Email:").bold()
                    Text(viewModel.user?.email ?? "Unknown")
                }
                HStack{
                    Text("Member Since:").bold()
                    if let date = viewModel.user?.joined{
                        let date = Date(timeIntervalSince1970: date).formatted(date: .abbreviated, time: .standard)
                        Text(date)
                    }
                }
            }
            .padding()
            //Spacer()
            TDbutton(buttonTitle: "SignOut", buttonBackground: .red) {
                viewModel.logOut()
            }.frame(width: 200,height: 100)
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}

