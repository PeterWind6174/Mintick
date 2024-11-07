import SwiftUI

struct HomePage: View {
    @EnvironmentObject var data : ButtonClass
    
    @State private var isShowingButtonEditor = false  // 控制弹窗显示状态
    
    // 计算属性，返回格式化后的今天日期字符串
    var currentDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium  // 使用中等样式
        dateFormatter.timeStyle = .none  // 不显示时间
        return dateFormatter.string(from: Date())
    }
    
    let columnLayout = Array(repeating: GridItem(.flexible()), count: 2)//网格属性
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    BlueRectangle()
                    //顶部蓝色矩形
                    
                    LazyVGrid(columns: columnLayout){
                        ForEach(data.pubbottons){ Pubbuttons in                   
                            Button{
                                print("\(Pubbuttons.name)被点击")
                            }label: {
                                ButtonRow(thisButton: Pubbuttons)
                            }
                        }
                                                                        
                    }
                    .padding(.top, 20)
                    //网格显示按钮
                    
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
                        
                        ButtonEdit() // 将输入的文字作为新按钮的标题
                        
                    }
                     
                    
                }
            }
        }
    }
}


#Preview {
    HomePage().environmentObject(ButtonClass())
}
