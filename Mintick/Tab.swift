//
//  MainpageView.swift
//  Mintick
//
//  Created by PeterWind on 2024/10/8.
//

import SwiftUI

struct Tab: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            Main()
            .tabItem {
                Text("记录")
                Image(systemName: "house.fill")
                    .renderingMode(.template)
            }
            .tag(0)
            
            NavigationStack() {
                Text("Profile view")
                    .navigationTitle("总览")
            }
            .tabItem {
                Label("总览", systemImage: "person.fill")
            }
            .tag(1)
            
            NavigationStack() {
                Text("About view")
                    .navigationTitle("设置")
                
            }
            .tabItem {
                Text("设置")
                Image(systemName: "info.circle")
            }
            .tag(2)
        }
        
        //Change title color
        /*
        .tint(.blue)
        .onAppear(perform: {
            UITabBar.appearance().unselectedItemTintColor = .systemGray
            UITabBar.appearance().backgroundColor = .systemGray4
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        })*/
    }
}

#Preview {
    Tab()
}
