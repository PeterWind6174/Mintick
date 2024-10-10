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
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.blue)
                        .frame(height: 100)
                        .padding()
                    
                    HStack {
                        Text("HH:MM:SS")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        //.padding(.leading, 20) // 文字左对齐
                        
                        Spacer() // 添加间隔符，让按钮靠右对齐
                        
                        // 第一个圆形按钮
                        Button(action: {
                            //Actions
                        }) {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40)
                        }
                        
                        Spacer()
                        
                        // 第二个圆形按钮
                        Button(action: {
                            //Actions
                        }) {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40)
                        }
                    }
                    .frame(width: 280) // 限制 HStack 的宽度，保证布局美观
                }
            }
            .navigationBarTitle("今天的日期")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        //Actions
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}


#Preview {
    Main()
}
