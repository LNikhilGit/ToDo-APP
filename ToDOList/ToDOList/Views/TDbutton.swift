//
//  TDbutton.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/26/23.
//

import SwiftUI

struct TDbutton: View {
    let buttonTitle : String
    let buttonBackground : Color
    let action : ()-> Void
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(buttonBackground)
                Text(buttonTitle).foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .padding()
        }
    }
}

#Preview {
    TDbutton(buttonTitle: "", buttonBackground: .blue){
        print("Button")
    }
}

