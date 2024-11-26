//
//  ToDoListView.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var vm = ToDoListVM()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("To Do List")
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing:
                                    Button(action: {
                vm.newItemViewPresented.toggle()
                                    }, label: {
                                        Image(systemName: "plus.circle")
                                    })
            )
            .sheet(isPresented: $vm.newItemViewPresented, content: {
                NewItemView(vm: {
                    let newVm = NewItemVM()
                    newVm.addListener(self.vm)
                    return newVm
                }())
            })
        }
    }
}

#Preview {
    ToDoListView()
}
