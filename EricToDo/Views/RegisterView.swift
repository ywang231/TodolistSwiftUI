//
//  RegisterView.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var vm = RegisterVM()
    
    var body: some View {
        VStack {
            LoginHeaderView(backgroundColor: Color.orange,
                            rotateDegree: -15,
                            title: "Eric Todo",
                            subtitle: "Sign up")
            Form {
                TextField("Full Name", text: $vm.name)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                TextField("Email Address", text: $vm.email)
                    .autocorrectionDisabled()
                SecureField("Password", text: $vm.password)
                ELButton(_backgroundColor: Color.green,
                         _title: "Submit") { tag in
                    self.vm.register()
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
