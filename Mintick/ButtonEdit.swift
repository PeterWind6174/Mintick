import SwiftUI

struct ButtonEditor1: View {
    @Environment(\.dismiss) var dismiss  // 用于控制弹窗关闭
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("这是 ButtonEditor 视图")
                    .font(.title)
                    .padding(.bottom, 20)
                
                Button("保存") {
                    print("保存按钮点击")
                }
                .buttonStyle(.borderedProminent)  // 美化按钮
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") {
                        withAnimation {
                            dismiss()  // 增加动画效果
                        }
                    }
                }
                
                // 中央标题
                ToolbarItem(placement: .principal) {
                    Text("按钮编辑器")
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    ButtonEditor()
}
