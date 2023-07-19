import SwiftUI

struct CardProximaRega: View {
    let title: String = "Próxima rega:"
    let content: String
    let icon: String = "Water-Blue"
    let cardColor: String = "BlueAlertCard"
    let backgroudCardColor: String = "BlueAlertCard"
    let textColor: String = "TextColor"
    let titleFont: String = "Satoshi-Regular"
    let contentFont: String = "Satoshi-Bold"
    var action: () -> Void
    
    
    var body: some View {
        HStack {
            ZStack{
                Circle()
                    .frame(width: 52, height: 52)
                    .foregroundColor(Color(cardColor))
                Image(icon)
            }
            .padding(.leading, 20)
            VStack(alignment: .leading){
                Spacer()
                Text(title)
                    .font(.custom(titleFont, size: 16))
                Spacer().frame(height: 2)
                Text(content)
                    .font(.custom(contentFont, size: 18))
                BotaoMarcarRegado(action: action)
                .padding(.bottom, 22)
            }
            .foregroundColor(Color(textColor))
            .padding(.leading, 16)
            Spacer()
   
        }
        .frame(width: 350,height: 118)
        .background(
            Color(backgroudCardColor)
        )
        .cornerRadius(12)
    }
}

struct CardProximaRega_Previews: PreviewProvider {
    static var previews: some View {
        CardProximaRega(content: "12/05"){}
    }
}

