import SwiftUI

struct BlueRectangle: View {
    var body: some View {
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
    }
}

#Preview {
    BlueRectangle()
}
