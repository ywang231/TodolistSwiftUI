//
//  MainView.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var vm = MainVM()
    
    var body: some View {
        if vm.isSignedIn, !vm.currentUserId.isEmpty {
            TodoItemView()
        }
        else {
            NavigationView {
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
