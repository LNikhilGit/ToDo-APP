//
//  NewItenView.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/28/23.
//

import SwiftUI

struct NewItenView: View {
    @Binding var neItemPresenter : Bool
    @StateObject var viewModel = NewItemViewModel()
    var body: some View {
        VStack{
            Text("NEW To-DO List")
                .font(.system(size: 30))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top, 80)
            Form{
                TextField("To-DO Name", text: $viewModel.title)
                DatePicker("", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TDbutton(buttonTitle: "Save", buttonBackground: .pink) {
                    if viewModel.canSaved{
                        viewModel.save()
                        neItemPresenter = false
                    }
                    else{
                        viewModel.showAlert = true
                    }
                }.padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Enter the all the fields and select valid due date"))
            })
            
        }
    }
}

#Preview {
    NewItenView(neItemPresenter: Binding(get: {return true}
                                         , set: { _ in

    }))
}

