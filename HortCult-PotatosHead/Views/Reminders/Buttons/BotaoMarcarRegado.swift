import SwiftUI

struct BotaoMarcarRegado: View {
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
                Text("Marcar como regado")
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
                                    .frame(width: 15, height: 15)
                            }
                        }
                    )
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isPressed ? Color("MainColor") : Color.clear)
                    .scaleEffect(isPressed ? 1.0 : 0.1)
            )
        }
    }
}

struct BotaoMarcarRegado_Previews: PreviewProvider {
    static var previews: some View {
        BotaoMarcarRegado()
    }
}


