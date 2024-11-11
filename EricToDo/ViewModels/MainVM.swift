//
//  MainVM.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import Foundation
import FirebaseAuth

class MainVM : ObservableObject {
    @Published var currentUserId: String = ""
    private var authHandler : AuthStateDidChangeListenerHandle?
    
    init() {
        self.authHandler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
}
