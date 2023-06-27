import SwiftUI

struct Card: View {
    let title: String
    let content: String
    let icon: String
    let cardColor: String
    let backgroudCardColor: String
    let textColor: String
    let titleFont: String
    let contentFont: String
    
    
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
                    .font(.custom(titleFont, size: 18))
                Spacer().frame(height: 2)
                Text(content)
                    .font(.custom(contentFont, size: 16))
                BotaoFeito()
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

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title: "Batatão está com sede!", content: "Dê água para a sua plantinha.", icon: "Water-Orange", cardColor: "lembreteIcon", backgroudCardColor: "AlertCardColor", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular")
    }
}
