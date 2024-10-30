import SwiftUI

struct ButtonEditor: View {
    @Environment(\.dismiss) var dismiss  // 用于控制弹窗关闭
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("这是 ButtonEditor 视图")
                    .font(.title)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") {
                        dismiss()
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


