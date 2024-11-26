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
            accountView
        }
        else {
            NavigationView {
                LoginView()
            }
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView().tabItem {
                Label("Home", systemImage: "list.dash")
            }
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}



#Preview {
    MainView()
}
