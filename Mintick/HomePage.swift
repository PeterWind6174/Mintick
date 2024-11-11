import SwiftUI

struct HomePage: View {
    @EnvironmentObject var data: ButtonClass
    @State private var isShowingButtonEditor = false  // 控制弹窗显示状态

    // 计算属性，返回格式化后的今天日期字符串
    var currentDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: Date())
    }
    
    let columnLayout = Array(repeating: GridItem(.flexible()), count: 2)  // 网格属性

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    BlueRectangle()  // 顶部蓝色矩形
                    
                    LazyVGrid(columns: columnLayout) {
                        ForEach(data.pubbottons) { pubbutton in
                            ButtonRow(thisButton: pubbutton) {
                                // 删除按钮的操作
                                if let index = data.pubbottons.firstIndex(where: { $0.id == pubbutton.id }) {
                                    data.pubbottons.remove(at: index)
                                }
                            }
                        }
                    }
                    .padding(.top, 20)  // 网格显示按钮
                    
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
                    .sheet(isPresented: $isShowingButtonEditor) {
                        ButtonEdit()
                            .environmentObject(data)  // 传递 EnvironmentObject
                    }
                }
            }
        }
    }
}

#Preview {
    HomePage().environmentObject(ButtonClass())
}
