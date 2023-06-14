import SwiftUI

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
               
                .padding(.horizontal)
                .padding(.vertical)
                
                VStack (spacing: 20){
                    NameTextfield()
                    DescriptionTextfield()
                }
            }
        }
    }
}

struct TextScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextScreen()
    }
}

