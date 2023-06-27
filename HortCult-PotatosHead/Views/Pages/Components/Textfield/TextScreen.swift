import SwiftUI

struct TextScreen: View {
    @Binding var text: String
    @Binding var description: String
    @State var isEdit: Bool
    
    var body: some View {
        
        
            VStack {
                VStack (spacing: 20){
                    NameTextfield(text: $text, placeholder: "Insira um nome")
                    DescriptionTextfield(text: $description, placeholder: "Insira uma descrição")
                }
            }
        
    }
}

struct TextScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextScreen(text: .constant(""), description: .constant(""), isEdit: false)
    }
}

