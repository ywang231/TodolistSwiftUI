//
//  NewItermVM.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import Foundation
import SwiftUICore
import FirebaseAuth
import FirebaseFirestore

protocol NewItemActionProtocol : AnyObject {
    func newItemSave(_: NewItemVM) -> Void
    func newItemCancle(_: NewItemVM) -> Void
}

class NewItemVM : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    
    //Alert and error mags for the tasks entered before submitting
    @Published var showAlert = false
    @Published var alertMsg = ""
    
    //Uploading indicator while submitting, if error occure, show the error message.
    @Published var submit_loading = false
    @Published var submit_error = ""
    
    //When plus and save button are clicked in NewItemView, notify the related viewmodels listened to this action
    private var actionProtocol : [NewItemActionProtocol?] = []
    
    func addListener(_ listener: NewItemActionProtocol) {
        self.actionProtocol.append ( { [weak listener] in listener }())
    }
    
    private func cleanInexistantDelegates() {
        self.actionProtocol.removeAll {
            $0 == nil
        }
    }
    
    // Logic for checking if input is abiding by the rules before clicking the save button.
    var canSave: Bool {
        //Neither empty or whitespace is valid for a title.
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertMsg = "No valid title!"
            return false
        }
        
        //Due date is impossible to be earlier than now plus one day.
        guard dueDate >= Date().addingTimeInterval(-60*60*24) else {
            alertMsg = "Due date is not valid"
            return false
        }
        
        return true
    }
    
    //Handle for the save button clicked
    func save() {
        guard canSave else {
            showAlert = true
            return
        }
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        
        let newItem = ToDoItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            creatDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary()) { error in
                if let error = error  {
                    
                }
                else {
                    
                }
            }
        
        
        for listener in actionProtocol {
            listener?.newItemSave(self)
        }
    }
    
    //Handle for the cancel button clicked
    func cancle() {
        for listener in actionProtocol {
            listener?.newItemCancle(self)
        }
    }
}
