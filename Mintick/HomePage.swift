import SwiftUI

struct HomePage: View {
    @State private var buttons: [String] = []  // 使用字符串数组来存储按钮标题
    @State private var isShowingButtonEditor = false  // 控制弹窗显示状态
    
    // 计算属性，返回格式化后的今天日期字符串
    var currentDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium  // 使用中等样式
        dateFormatter.timeStyle = .none  // 不显示时间
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // 顶部蓝色矩形
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
                            
                            // 圆形按钮（占位）
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40)
                            
                            Spacer(minLength: 10)
                            
                            // 圆形按钮（占位）
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40)
                        }
                        .frame(width: 280)
                        .padding(.horizontal)
                    }
                    
                    // 使用两列按钮网格布局，按钮宽度为固定值
                    LazyVGrid(columns: [GridItem(.fixed(UIScreen.main.bounds.width / 2 - 20)),
                                        GridItem(.fixed(UIScreen.main.bounds.width / 2 - 20))], spacing: 16) {
                        ForEach(buttons, id: \.self) { title in
                            Button(title) {
                                print("\(title) 按钮被点击")
                            }
                            .frame(height: 60)  // 固定按钮高度
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)  // 按钮背景颜色为主题色
                            .foregroundColor(.white)  // 按钮字体颜色为白色
                            .cornerRadius(10)
                            .padding(.top, 8)
                        }
                    }
                                        .padding(.horizontal, 10)
                }
            }
            .navigationTitle(currentDateString)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingButtonEditor = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            // 弹出 ButtonEdit 视图
            .sheet(isPresented: $isShowingButtonEditor) {
                ButtonEdit { newTitle in
                    buttons.append(newTitle)  // 将输入的文字作为新按钮的标题
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
