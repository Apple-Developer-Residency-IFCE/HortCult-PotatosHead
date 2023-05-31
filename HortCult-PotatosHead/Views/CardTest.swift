import SwiftUI

struct Cardd: View {
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
                Text(content)
                    .font(.custom(contentFont, size: 16))
                
                Button(action: {
                    print("OII")
                }) {
                    Text("Feito")
                        .font(.custom("Satoshi-Regular", size: 12))
                        .padding(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("buttonCardColor"),lineWidth: 1)
                        )
                }
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

struct CardListView: View {
    let cards: [CardViewModel]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Lembretes")
                    .font(.custom("Satoshi-Bold", size: 28))
                    .foregroundColor(Color("MainColor"))
                    .padding(.leading, 22)
                

                LazyVStack(spacing: 16) {
                    ForEach(cards, id: \.id) { card in
                        CardView(card: card)
                    }
                }
                .padding()
            }
        }
    }
}

struct CardView: View {
    let card: CardViewModel
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 52, height: 52)
                    .foregroundColor(Color(card.cardColor))
                Image(card.icon)
            }
            .padding(.leading, 20)
            VStack(alignment: .leading) {
                Spacer()
                Text(card.title)
                    .font(.custom(card.titleFont, size: 18))
                Text(card.content)
                    .font(.custom(card.contentFont, size: 16))
                
                Button(action: {
                    print("OII")
                }) {
                    Text("Feito")
                        .font(.custom("Satoshi-Regular", size: 12))
                        .padding(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("buttonCardColor"), lineWidth: 1)
                        )
                }
                .padding(.bottom, 22)
            }
            .foregroundColor(Color(card.textColor))
            .padding(.leading, 16)
            Spacer()
        }
        .frame(width: 350, height: 118)
        .background(
            Color(card.backgroudCardColor)
        )
        .cornerRadius(12)
    }
}

struct CardViewModel: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let icon: String
    let cardColor: String
    let backgroudCardColor: String
    let textColor: String
    let titleFont: String
    let contentFont: String
}

struct CardTest: View {
    let cards: [CardViewModel] = [
        CardViewModel(title: "Batatinha Frita 123", content: "testando", icon: "Water-Orange", cardColor: "lembreteIcon", backgroudCardColor: "AlertCardColor", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular"),
        CardViewModel(title: "Batatinha Frita 321", content: "testando", icon: "Water-Blue", cardColor: "blueReminderIcon", backgroudCardColor: "BlueAlertCard", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular"),
        CardViewModel(title: "Batatinha Frita 1234", content: "testando", icon: "Water-Orange", cardColor: "lembreteIcon", backgroudCardColor: "AlertCardColor", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular")
    ]
    
    var body: some View {
        CardListView(cards: cards)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardTest()
    }
}

