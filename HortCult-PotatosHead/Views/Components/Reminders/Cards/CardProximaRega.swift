import SwiftUI

struct CardProximaRega: View {
    let title: String
    let content: String
    let icon: String
    let cardColor: String
    let backgroudCardColor: String
    let textColor: String
    let titleFont: String
    let contentFont: String
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
        CardProximaRega(title: "Próxima rega:", content: "12/05", icon: "Water-Blue", cardColor: "blueReminderIcon", backgroudCardColor: "BlueAlertCard", textColor: "TextColor", titleFont: "Satoshi-Regular", contentFont: "Satoshi-Bold"){}
    }
}

