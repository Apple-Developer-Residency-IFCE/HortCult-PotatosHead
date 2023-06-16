import SwiftUI

struct CategoryDropDown: View {
    @State private var isExpanded = false
    @State private var selectedOption = ""
    
    let options = ["Diária", "A cada 2 dias", "A cada 4 dias", "1 vez por semana"]
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
            }) {
                HStack {
                    if selectedOption.isEmpty {
                        Text("Selecionar...")
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("navBarColor"))
                            .padding(.horizontal, 8)
                    } else {
                        Text(selectedOption)
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("navBarColor"))
                            .padding(.horizontal, 8)
                    }
                    Spacer()
                    Image(isExpanded ? "Dropdown-Inverted" : "Dropdown")
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("navBarColor"))
                        .padding(.horizontal, 8)
                }
                .padding(8)
                .foregroundColor(.black)
                .cornerRadius(8)
            }
            
            if isExpanded {
                ForEach(options, id: \.self) { option in
                    HStack {
                        Text(option)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 4)
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("ButtonThemeColor"))
                        Spacer()
                    }
                    .onTapGesture {
                        withAnimation {
                            self.selectedOption = option
                            
                            self.isExpanded.toggle()
                        }
                    }
                }
                .cornerRadius(8)
                .padding(.horizontal, 12)
            }
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color("hourButton"), lineWidth: 1)
        }
    }
}

struct CategoryDropDownView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Frequência de Rega")
                .font(.custom("Satoshi-Regular", size: 12))
                .foregroundColor(Color("buttonCardColor"))
                .padding(.horizontal, 20)
            
            CategoryDropDown()
                .padding(.horizontal, 20)
        }
    }
}

struct CategoryDropDown_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDropDownView()
    }
}


