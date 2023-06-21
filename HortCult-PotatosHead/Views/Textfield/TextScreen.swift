import SwiftUI

struct TextScreen: View {
    @Binding var text: String
    @Binding var description: String
    @State var isEdit: Bool
    
    var body: some View {
        
        
            VStack {
                VStack (spacing: 20){
                    NameTextfield(text: $text)
                    DescriptionTextfield(text: $description)
                }
            }
        
    }
}

struct TextScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextScreen(text: .constant(""), description: .constant(""), isEdit: false)
    }
}

