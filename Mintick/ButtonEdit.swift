import SwiftUI

struct ButtonEdit: View {
    @Environment(\.dismiss) var dismiss  // 控制弹窗关闭
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // 保存按钮
                Button("保存") {
                    print("保存的名称")
                }
                .buttonStyle(.borderedProminent)
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
    ButtonEdit()
}
