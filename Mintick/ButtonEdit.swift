import SwiftUI

struct ButtonEdit: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data : ButtonClass
    @State var newButton : Pubbuttons = Pubbuttons(name:"")
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Form{
                    Section("记录的名称"){
                        TextField("按钮名称",text: $newButton.name)
                    }
                }
            }
            
            .toolbar{ 
                
                ToolbarItem(placement:.navigationBarLeading){
                    
                    Button("取消"){
                        dismiss()
                    }
                }                   //取消按钮
                
                ToolbarItem(placement:.principal){
                    Text("添加记录")
                }                   //标题
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("添加"){
                        print("1")
                        data.pubbottons.append(newButton)
                        print("2")
                        dismiss()
                        print("3")
                        
                    }
                }                   //添加新记录
                
            }
        }
    }
}



#Preview{
    ButtonEdit().environmentObject(ButtonClass())
}
