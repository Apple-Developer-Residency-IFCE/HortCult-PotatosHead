import SwiftUI

struct DescriptionTextfield: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Descrição")
                .font(.custom("Satoshi-Regular", size: 12))
                .foregroundColor(Color("buttonCardColor"))
            VStack{
                if text.isEmpty {
                    TextEditor(text: $text)
                        .padding(.leading)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                        .frame(height: 200)
                        .overlay(
                            Text(placeholder)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("hourButton"))
                                .padding(.vertical, -90)
                                .padding(.horizontal, 20)
                        )
                } else {
                    TextEditor(text: $text)
                        .padding(.leading)
                        .foregroundColor(.primary)
                }
            }
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

struct DescriptionTextfield_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionTextfield(text: .constant(""), placeholder: "Insria uma descrição")    }
}


