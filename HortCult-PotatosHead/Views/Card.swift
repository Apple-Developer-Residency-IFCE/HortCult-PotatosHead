import SwiftUI

struct Card: View {
    var body: some View {
        HStack /*(alignment: .leading, spacing: 16)*/ {
            ZStack{
                Circle()
                    .frame(width: 52, height: 52)
                    .foregroundColor(Color("lembreteIcon"))
                Image("Water-Orange")
            }
            .padding(.leading, 20)
            VStack{
                Text("Batatão está com sede!")
                    .font(.custom("Satoshi-Bold", size: 18))
                    .foregroundColor(Color("TextColor"))
            }
            .padding(.leading, 16)
            Spacer()
   
        }
        .frame(width: 350,height: 118)
        .background(
            Color("AlertCardColor")
        )
        .cornerRadius(12)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
