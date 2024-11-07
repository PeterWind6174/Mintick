import SwiftUI

struct BlueRectangle: View {
    var timerText: String  // 计时器文本
    var buttonName: String  // 被点击按钮的名称
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.blue)
                .frame(height: 100)
                .padding()
            
            VStack(spacing: 5) {
                HStack {
                    Text(buttonName)  // 显示被点击按钮的名称
                        .font(.headline)
                        .foregroundColor(.white)
                    //Spacer()
                }
                
                HStack {
                    Text(timerText)  // 显示计时器
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 40, height: 40)
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 40, height: 40)
                    
                    Spacer()
                }
                .frame(width: 280)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    BlueRectangle(timerText: "00:00:00", buttonName: "示例按钮")
}
