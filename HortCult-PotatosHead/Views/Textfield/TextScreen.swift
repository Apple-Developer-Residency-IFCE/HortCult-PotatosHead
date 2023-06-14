import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

struct RectangularTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack {
            configuration
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 8)
                .frame(maxWidth: .infinity, alignment: .leading)

            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 1)
        }
        .padding(68)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct TextScreen: View {
    @State var text = ""
    @State var description = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Adicionar Vegetal")
                        .font(.custom("Satoshi-Bold", size: 28))
                        .foregroundColor(Color("MainColor"))
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
               
                VStack(alignment: .leading) {
                    Text("Nome")
                        .font(.custom("Satoshi-Regular", size: 12))
                        .foregroundColor(Color("buttonCardColor"))
                    
                    HStack {
                        TextField("Insira um nome", text: $text)
                    }
                    .textFieldStyle(OvalTextFieldStyle())
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("hourButton"))
                    
                    Spacer().frame(height: 28)
                    
                    Text("Descrição")
                        .font(.custom("Satoshi-Regular", size: 12))
                        .foregroundColor(Color("buttonCardColor"))
                    
                    HStack {
                        ZStack(alignment: .topLeading) {
                            TextField("", text: $description)
                                .textFieldStyle(RectangularTextFieldStyle())
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("hourButton"))
                            
                            if description.isEmpty {
                                TextField("Insira uma descrição", text: $description)
                                    .foregroundColor(Color("hourButton"))
                                    .font(.custom("Satoshi-Regular", size: 16))
                                    .padding(.horizontal, 8)
                                    .padding(.top, 10)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct TextScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextScreen()
    }
}

