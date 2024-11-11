import SwiftUI

class ButtonClass : ObservableObject {
    @Published var pubbottons: [Pubbuttons] = [
        
    ]
}

struct Pubbuttons : Identifiable{
    var name : String
    var id = UUID()
}
 
