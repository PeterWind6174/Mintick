import SwiftUI

struct ButtonRow: View {
    var thisButton: Pubbuttons
    var deleteAction: () -> Void  // 删除按钮的操作
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.green)
                .frame(height: 80)
                .padding(.horizontal)
            
            Text(thisButton.name)
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .contextMenu {
            Button(role: .destructive) {
                deleteAction()
            } label: {
                Label("删除", systemImage: "trash")
            }
        }
    }
}

#Preview {
    ButtonRow(thisButton: Pubbuttons(name: "Example Button")) {
        // 示例删除操作
    }
}
