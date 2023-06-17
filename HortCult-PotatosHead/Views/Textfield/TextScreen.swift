import SwiftUI

struct TextScreen: View {
    @Binding var text: String
    @Binding var description: String
    
    
    var body: some View {
        var isEdit: Bool = false
        NavigationView {
            VStack {
                HStack {
                    Text(isEdit ? "Editar Informações" : "Adicionar Vegetal")
                        .font(.custom("Satoshi-Bold", size: 28))
                        .foregroundColor(Color("MainColor"))
                    Spacer()
                }
               
                .padding(.horizontal)
                .padding(.vertical)
                
                VStack (spacing: 20){
                    NameTextfield(text: $text)
                    DescriptionTextfield(text: $description)
                }
            }
        }
    }
}

struct TextScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextScreen(text: .constant(""), description: .constant(""))
    }
}

