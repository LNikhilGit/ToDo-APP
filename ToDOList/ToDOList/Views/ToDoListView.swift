//
//  ToDoListView.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/28/23.
//

import SwiftUI
import FirebaseFirestoreSwift
struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack(alignment:.leading){
                List(items){
                    item in
                   ToDoListItemView(item: item).swipeActions(){
                       Button{
                           viewModel.delete(id: item.id)
                       }
                   label: {
                           Image(systemName: "xmark.bin")
                       }
                   .tint(.red)
                   }
                   // Text(item.title)
                }
            }
            .navigationTitle("ToDo Tasks")
            .toolbar{
                Button{
                    viewModel.showItemNewview = true
                } label: {
                    Image(systemName: "plus").tint(.black)
                }
            }
        }
        .sheet(isPresented: $viewModel.showItemNewview){
            NewItenView(neItemPresenter: $viewModel.showItemNewview)
        }
    }
}

#Preview {
    ToDoListView(userId: "iz5k3UjPCVfvoyOK8zMG421cPlA3")
}

