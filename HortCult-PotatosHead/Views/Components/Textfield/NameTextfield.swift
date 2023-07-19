import SwiftUI

struct NameTextfield: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nome")
                .font(.custom("Satoshi-Regular", size: 12))
                .foregroundColor(Color("buttonCardColor"))
                .padding(.horizontal, 1)
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(.custom("Satoshi-Regular", size: 16))
                        .padding(.leading)
                        .opacity(0.5)
                }
                
                TextField("", text: $text)
                    .padding(.leading)
            }
            .frame(height: 40)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .padding(.horizontal, 20)
    }
}

struct NameTextfield_Previews: PreviewProvider {
    static var previews: some View {
        NameTextfield(text: .constant(""), placeholder: "Insira um nome")
    }
}

