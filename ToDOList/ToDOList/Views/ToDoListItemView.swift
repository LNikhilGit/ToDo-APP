//
//  ToDoListItemView.swift
//  ToDOList
//
//  Created by Nikhil Lalam on 12/29/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(item.title)")
                    .font(.body)
                
                let date = Date(timeIntervalSince1970: item.date).formatted(date: .abbreviated, time: .standard)
            
                Text("\(date)")
                    .font(.footnote)
            }
            Spacer()
            Button{
                viewModel.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.square.fill" : "square").font(.system(size: 28))
            }.foregroundColor(.black)
        }.padding()
    }
}

#Preview {
    ToDoListItemView(item: ToDoListItem(id: "123", title: "track", date: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false))
}
