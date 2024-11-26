//
//  ToDoListVM.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import Foundation

class ToDoListVM :ObservableObject, NewItemActionProtocol {
    
    @Published var newItemViewPresented = false
    
    //---- NewItemActionProtocol ------------------------
    func newItemSave(_: NewItemVM) {
        self.newItemViewPresented.toggle()
    }
    
    func newItemCancle(_: NewItemVM) {
        self.newItemViewPresented.toggle()
    }
}
