import SwiftUI

@main
struct MinTickApp: App {
    @StateObject var data = ButtonClass()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
        
        
    }
}
