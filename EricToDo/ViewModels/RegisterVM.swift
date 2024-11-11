//
//  RegisterVM.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterVM : ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMsg : String?
    
    init() {}
    
    func register () {
        guard validate() else {return}
        
        Auth.auth().createUser(withEmail: email,
                               password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
            
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joinedTime: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
        
    }
    
    private func validate () -> Bool {
        
        let nameTrimmed = self.name.trimmingCharacters(in: .whitespaces)
        guard !nameTrimmed.isEmpty else {
            self.errorMsg = "Please input name"
            return false
        }
        
        let emailTrimmed = email.trimmingCharacters(in: .whitespaces)
        
        // Email inputed is empty
        guard !emailTrimmed.isEmpty else {
            self.errorMsg = NSLocalizedString("Email empty", comment: "")
            return false
        }
        
        // Email format validation
        guard emailTrimmed.isValidEmail() else {
            self.errorMsg = NSLocalizedString("Email not valid", comment: "")
            return false
        }
        
        // Password are not allowed to be empty
        guard !password.isEmpty else {
            errorMsg = NSLocalizedString("Password empty", comment: "")
            return false
        }
        
        // Strong and valid password validation
        guard password.isValidPassword() else {
            errorMsg = "Please input a valid password"
            return false
        }
        
        return true
    }
}
