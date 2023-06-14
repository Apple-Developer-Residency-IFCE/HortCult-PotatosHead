import SwiftUI

struct PlaceholderNameTextView: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        VStack (alignment: .leading){
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    TextEditor(text: $text)
                        .padding(.leading)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                        .overlay(
                            Text(placeholder)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("hourButton"))
                                .padding(.horizontal, 20)
                        )
                } else {
                    TextEditor(text: $text)
                        .padding(.leading)
                        .foregroundColor(.primary)
                }
            }
            .frame(height: 40)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
    }
}

struct NameTextfield: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nome")
                .font(.custom("Satoshi-Regular", size: 12))
                .foregroundColor(Color("buttonCardColor"))
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            PlaceholderNameTextView(text: $text, placeholder: "Insira um nome")
                .padding(.horizontal, 20)
        }
    }
}

struct NameTextfield_Previews: PreviewProvider {
    static var previews: some View {
        NameTextfield()
    }
}
