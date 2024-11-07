import SwiftUI

struct ButtonRow: View {
    var thisButton: Pubbuttons
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.green)
                .frame(height: 80)
                .padding(.horizontal)
            
            Text(thisButton.name)
                .font(.largeTitle)
                .foregroundColor(.white) // 根据背景色调整文本颜色
        }
    }
}

#Preview {
    ButtonRow(thisButton: Pubbuttons(name: "Example Button"))
}
