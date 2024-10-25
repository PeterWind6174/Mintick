import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            // iPhone 上显示 TabView 样式
            TabView {
                HomePage()
                    .tabItem {
                        Image(systemName: "pencil.and.outline")
                        Text("记录")
                    }
                    .tag(0)
                
                Overview()
                    .tabItem {
                        Image(systemName: "text.rectangle.page")
                        Text("总览")
                    }
                
                Settings()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("设置")
                    }
            }
        } else {
            // iPad 上显示 Sidebar 样式
            NavigationSplitView {
                List {
                    NavigationLink(destination: HomePage()) {
                        Label("记录", systemImage: "pencil.and.outline")
                    }
                    NavigationLink(destination: Overview()) {
                        Label("总览", systemImage: "text.rectangle.page")
                    }
                    NavigationLink(destination: Settings()) {
                        Label("设置", systemImage: "gear")
                    }
                }
                .listStyle(SidebarListStyle())
            } detail: {
                Text("请选择一个项目")
            }
        }
    }
}
