//
//  TodoItemView.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import SwiftUI

struct TodoItemView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Todo Item")
            }
            .navigationTitle("Todo Item")
        }
    }
}

#Preview {
    TodoItemView()
}
