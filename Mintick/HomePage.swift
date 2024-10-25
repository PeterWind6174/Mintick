import SwiftUI

struct HomePage: View {
    @State private var buttons: [UUID] = []
    
    var body: some View { 
        NavigationStack {
            ScrollView {
                VStack {
                    // 原始圆角矩形部分
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.blue)
                            .frame(height: 100)
                            .padding()
                        
                        HStack {
                            Text("HH:MM:SS")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            // 第一个圆形按钮
                            Button(action: {
                                //Actions
                            }) {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 40, height: 40)
                            }
                            
                            Spacer(minLength: 10)
                            
                            // 第二个圆形按钮
                            Button(action: {
                                //Actions
                            }) {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 40, height: 40)
                            }
                        }
                        .frame(width: 280)
                        .padding(.horizontal)
                    }
                    
                    // 新增的圆角矩形按钮部分，放在原始圆角矩形下方
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(buttons, id: \.self) { _ in
                            Button(action:{
                                //Actions
                                //print("Respond!!!")
                            }){
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.green)
                                    .frame(height: 100)
                                    .padding()
                                    .overlay(
                                        Text("新按钮")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                    )
                            }
                        }
                    }
                    .padding(.top, 20) // 与原始矩形保持一定距离
                }
            }
            .navigationTitle("今天的日期")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // 每次点击 ➕ 按钮，向 buttons 数组中添加一个新按钮
                        buttons.append(UUID())
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
