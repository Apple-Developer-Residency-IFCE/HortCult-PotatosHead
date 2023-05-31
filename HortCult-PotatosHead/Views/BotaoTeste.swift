import SwiftUI

struct BotaoTeste: View {
    @State private var isPressed = false
    
    var body: some View {
        ZStack {
            Color.clear
                .frame(width: 26, height: 16)
            
            Button(action: {
                print("OII")
                withAnimation {
                    isPressed.toggle()
                }
            }) {
                Text("Feito")
                    .font(.custom("Satoshi-Regular", size: 12))
                    .padding(6)
                    .foregroundColor(isPressed ? Color.clear : Color("TextColor"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("buttonCardColor"), lineWidth: isPressed ? 0 : 1)
                    )
                    .overlay(
                        Group {
                            if isPressed {
                                Image("Check")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                            }
                        }
                    )
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isPressed ? Color.green : Color.clear)
                    .scaleEffect(isPressed ? 1.0 : 0.1)
            )
        }
    }
}

struct BotaoTeste_Previews: PreviewProvider {
    static var previews: some View {
        BotaoTeste()
    }
}

