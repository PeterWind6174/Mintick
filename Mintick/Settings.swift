import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationStack{
            
            List{
                
                NavigationLink{
                    Setting1()
                        .navigationTitle("设置1")
                } label : {
                    Image(systemName: "text.document")
                        .symbolRenderingMode(.multicolor)
                    Text("设置1")
                    
                }
            }
            
            .navigationTitle("设置")
        }
    }
}

















#Preview{
    Settings()
}
