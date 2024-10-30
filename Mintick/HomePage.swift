import SwiftUI

struct HomePage: View {
    @State private var buttons: [UUID] = []
    @State private var isShowingButtonEditor = false  // 控制弹窗显示状态
    
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
                    
                    
                    .navigationTitle("今天的日期")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                isShowingButtonEditor = true  // 打开弹窗
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    // 弹出 ButtonEditor 视图
                    .sheet(isPresented: $isShowingButtonEditor) {
                        ButtonEditor()
                    }
                }
            }
        }
    }
}
// ButtonEditor 视图

#Preview {
    HomePage()
}
