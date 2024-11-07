import SwiftUI
import Combine

struct HomePage: View {
    @EnvironmentObject var data: ButtonClass
    @State private var isShowingButtonEditor = false
    @State private var timerText = "00:00:00"
    @State private var selectedButtonName: String = ""
    @State private var secondsElapsed: Int = 0
    @State private var timerSubscription: Cancellable?

    var currentDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: Date())
    }
    
    let columnLayout = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // 传递计时器文本和按钮名称给 BlueRectangle
                    BlueRectangle(timerText: timerText, buttonName: selectedButtonName)
                    
                    LazyVGrid(columns: columnLayout) {
                        ForEach(data.pubbottons) { pubbutton in
                            ButtonRow(thisButton: pubbutton) {
                                startTimer(for: pubbutton.name)
                            }
                        }
                    }
                    .padding(.top, 20)
                    
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
                            .environmentObject(data)
                    }
                }
            }
        }
    }
    
    // 启动计时器
    func startTimer(for buttonName: String) {
        // 停止现有计时器
        timerSubscription?.cancel()
        selectedButtonName = buttonName
        secondsElapsed = 0
        updateTimerText()
        
        // 创建并订阅新的计时器
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                secondsElapsed += 1
                updateTimerText()
            }
    }
    
    // 格式化计时器文本
    func updateTimerText() {
        let hours = secondsElapsed / 3600
        let minutes = (secondsElapsed % 3600) / 60
        let seconds = secondsElapsed % 60
        timerText = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

#Preview {
    HomePage().environmentObject(ButtonClass())
}
