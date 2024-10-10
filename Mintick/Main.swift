//
//  ContentView.swift
//  Mintick
//
//  Created by PeterWind on 10/9/24.
//

import SwiftUI

struct Main: View {
    var body: some View {
        NavigationView(){
            ScrollView(){
                Text("Hello")
                Spacer()
            }
            .navigationBarTitle("今天的日期")
        }
    }
}

#Preview {
    Main()
}
