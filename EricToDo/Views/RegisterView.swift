//
//  RegisterView.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import SwiftUI

struct RegisterView: View {
    @State var _name = ""
    @State var _email = ""
    @State var _password = ""
    
    var body: some View {
        VStack {
            LoginHeaderView(backgroundColor: Color.orange,
                            rotateDegree: -15,
                            title: "Eric Todo",
                            subtitle: "Sign up")
            Form {
                TextField("Full Name", text: $_name)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                TextField("Email Address", text: $_email)
                    .autocorrectionDisabled()
                SecureField("Password", text: $_password)
                ELButton(_backgroundColor: Color.green,
                         _title: "Submit") { tag in
                    
                }
            }
            .offset(y:-50)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
