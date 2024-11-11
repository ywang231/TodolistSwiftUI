//
//  Extensions.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-08.
//

import Foundation

extension String {
    //If a string is a valid
    func isValidEmail() -> Bool {
       let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
           let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
           return emailPredicate.evaluate(with: self)
    }
    
    //If a password is acceptable
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
           return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
}


extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    } 
}

