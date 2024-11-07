import SwiftUI

// 1. 让 Pubbuttons 遵循 Codable 协议
struct Pubbuttons: Identifiable, Codable {
    var name: String
    var id = UUID()
}

class ButtonClass: ObservableObject {
    @Published var pubbottons: [Pubbuttons] = [] {
        didSet {
            saveButtons()
        }
    }
    
    init() {
        loadButtons()  // 加载已存储的按钮数据
    }
    
    // 2. 使用 UserDefaults 存储按钮数据
    func saveButtons() {
        if let encoded = try? JSONEncoder().encode(pubbottons) {
            UserDefaults.standard.set(encoded, forKey: "SavedButtons")
        }
    }
    
    // 3. 从 UserDefaults 加载按钮数据
    func loadButtons() {
        if let savedData = UserDefaults.standard.data(forKey: "SavedButtons"),
           let decoded = try? JSONDecoder().decode([Pubbuttons].self, from: savedData) {
            pubbottons = decoded
        }
    }
}
