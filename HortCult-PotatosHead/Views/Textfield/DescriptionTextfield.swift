import SwiftUI

struct DescriptionTextfield: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Descrição")
                .font(.custom("Satoshi-Regular", size: 12))
                .foregroundColor(Color("buttonCardColor"))
                .padding(.horizontal, 8)
            
            TextEditorWrapper(text: $text, placeholder: placeholder)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding(.horizontal, 20)
    }
}

struct TextEditorWrapper: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                placeholderText
            }
            
            TextEditor(text: $text)
                .foregroundColor(.primary)
                .opacity(text.isEmpty ? 0.5 : 1)
                .padding(.leading)
        }
    }
    
    var placeholderText: some View {
        Text(placeholder)
            .font(.custom("Satoshi-Regular", size: 16))
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
    }
}

struct DescriptionTextfield_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionTextfield(text: .constant(""), placeholder: "Insira uma descrição")
    }
}

