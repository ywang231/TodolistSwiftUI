//
//  LoginVM.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import Foundation
import SwiftUICore
import FirebaseAuth


class LoginVM : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorStr : String?
    
    init() {}
    
    func login()  {
        // Clear the error message from the previous action
        self.errorStr = nil
    
        guard self.validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    //Check every input for login action
    private func validate () -> Bool {
        let emailTrimmed = email.trimmingCharacters(in: .whitespaces)
        // email textfeild is empty
        guard !emailTrimmed.isEmpty else {
            errorStr = NSLocalizedString("Email empty", comment: "")
            return false
        }
         
        guard emailTrimmed.isValidEmail() else {
            errorStr = NSLocalizedString("Email not valid", comment: "")
            return false
        }
        
        guard !password.isEmpty else {
            errorStr = NSLocalizedString("Password empty", comment: "")
            return false
        }
        
        return true
    }
}
