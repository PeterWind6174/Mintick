import SwiftUI

struct ButtonEdit: View {
    @Environment(\.dismiss) var dismiss  // 控制弹窗关闭
    @State private var eventName: String = ""  // 存储输入的文本
    var onSave: (String) -> Void  // 闭包，用于将文本传回 HomePage
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // 文本输入框
                TextField("学习……？", text: $eventName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // 保存按钮
                Button("保存") {
                    onSave(eventName)  // 传回输入的文本
                    dismiss()  // 关闭弹窗
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)  // 使按钮和 TextField 一样宽
                .navigationTitle("输入名称：")
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") {
                        withAnimation {
                            dismiss()
                        }
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("想干啥呢？")
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    ButtonEdit { eventName in
        print("预览模式下保存的文本: \(eventName)")
    }
}
