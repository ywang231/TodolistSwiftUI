//
//  LoginView.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var lVM = LoginVM()
    
    var body: some View {
        VStack {
            LoginHeaderView(backgroundColor: Color.pink,
                            rotateDegree: 15.0,
                            title: "EricToDo",
                            subtitle: "Get Tasks Done")
            Form {
                if let errormsg = lVM.errorStr {
                    Text(errormsg)
                        .foregroundColor(Color.red)
                }
                
                TextField("Email address", text: $lVM.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text:$lVM.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                ELButton(_backgroundColor: Color.blue,
                         _title: "Login") { tag in
                    lVM.login()
                }
            }
            .scrollDisabled(true)
            
            VStack {
                Text("New around here?")
                NavigationLink("Create An Account",
                               destination:  RegisterView())
                    .foregroundColor(Color.blue)
            }
            .padding(.bottom, 10)
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
