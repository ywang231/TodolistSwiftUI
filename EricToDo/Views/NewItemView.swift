//
//  NewItemView.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var vm: NewItemVM
    
    var body: some View {
        VStack {
            HStack {
                Text("New Task")
                    .font(.system(size: 25))
                    .bold()
                    .padding(.trailing, 50)

                Button {
                    vm.cancle()
                } label: {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 20))
                        .bold()
                }
                
            }
            .padding(.top, 30)
            
            Form {
                TextField("Title", text: $vm.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $vm.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                ELButton(_backgroundColor:.pink,
                         _title: "Save") { [weak vm] btn in
                    vm?.save()
                }
                .tag(100)
            }
        }.alert(isPresented: $vm.showAlert) {
            Alert(title: {
                Text(vm.alertMsg)
                    .font(.system(size: 20))
            }())
        }
    }
}

#Preview {
    NewItemView(vm: NewItemVM())
}
