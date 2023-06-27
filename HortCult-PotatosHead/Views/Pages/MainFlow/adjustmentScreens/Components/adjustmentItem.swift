

import SwiftUI

struct AdjustmentItem<Content: View>: View {
    var label: String
    var content: Content
    
    init(label: String, @ViewBuilder _ content: ()-> Content) {
        self.label = label
        self.content = content()
    }
    
    var body: some View{
        HStack {
           Text(label)
               .font(.custom("Satoshi-Bold", size: 18))
               .fontWeight(.bold)
               .foregroundColor(Color("MainColor"))
           Spacer()
           content

       }
    }
}

struct AdjustmentItem_Previews: PreviewProvider {
    static var previews: some View {
        AdjustmentItem(label: "Lucas") {
            Text("Teste")
            
        }
    }
}
