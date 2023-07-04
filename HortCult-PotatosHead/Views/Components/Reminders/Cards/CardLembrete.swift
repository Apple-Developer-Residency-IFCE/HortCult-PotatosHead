import SwiftUI

struct CardView: View {
    let card: CardViewModel
    var action: () -> Void
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 52, height: 52)
                .foregroundColor(Color(card.cardColor))
                .overlay(
                    Image(card.icon)
                )
                .padding(.leading, 20)
            
            VStack(alignment: .leading) {
                Spacer()
                Text(card.title)
                    .font(.custom(card.titleFont, size: 18))
                Spacer().frame(height: 2)
                Text(card.content)
                    .font(.custom(card.contentFont, size: 16))
                
                Button(action: {}) {
                    BotaoFeito(action: action)
                }
                .padding(.bottom, 22)
            }
            .foregroundColor(Color(card.textColor))
            .padding(.leading, 16)
            
            Spacer()
        }
        .frame(width: 350, height: 118)
        .background(Color(card.backgroudCardColor))
        .cornerRadius(12)
    }
}

struct CardListView: View {
    @Binding var cards: [CardViewModel]
    @EnvironmentObject var notificationViewModel: NotificationViewModel
    @EnvironmentObject var plantViewModel: PlantViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("Lembretes")
                .font(.custom("Satoshi-Bold", size: 28))
                .foregroundColor(Color("MainColor"))
                .padding(.leading, 22)
            
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(cards) { card in
                        CardView(card: card){
                            cards = HomeViewModel.checkCardNotification(notificationID: card.id, notificationViewModel: notificationViewModel, cards: cards, plantViewModel: plantViewModel)
                            
                        }
                    }
                    .padding().frame(height: 120)
                }
        }
    }
}

struct CardViewModel: Identifiable {
    let id: UUID
    let title: String
    let content: String
    let icon: String
    let cardColor: String
    let backgroudCardColor: String
    let textColor: String
    let titleFont: String
    let contentFont: String
}

struct CardLembrete: View {
   @State var cards: [CardViewModel] = []
    
    var body: some View {
        CardListView(cards: $cards)
    }
}

struct CardLembrete_Previews: PreviewProvider {
    static var previews: some View {
        CardLembrete()
    }
}

