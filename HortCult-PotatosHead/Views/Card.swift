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
            VStack(alignment: .leading){
                Spacer()
                Text("Batatão está com sede!")
                    .font(.custom("Satoshi-Bold", size: 18))
                Text("Dê água para a sua plantinha.")
                    .font(.custom("Satoshi-Regular", size: 16))
                
                Button(action: {
                    print("OII")
                }) {
                    Text("Feito")
                        .font(.custom("Satoshi-Regular", size: 12))
                        .padding(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("MainColor"),lineWidth: 1)
                        )
                }
                .padding(.bottom, 22)
            }
            .foregroundColor(Color("TextColor"))
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
