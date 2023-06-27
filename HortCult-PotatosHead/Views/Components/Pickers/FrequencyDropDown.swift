import SwiftUI

enum Frequency: String, CaseIterable {
    case daily = "Diária"
    case everyTwoDays = "A cada 2 dias"
    case everyFourDays = "A cada 4 dias"
    case weekly = "1 vez por semana"
}

struct FrequencyDropDown: View {
    @State private var isExpanded = false
    @Binding var selectedOption: Frequency?
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
            }) {
                HStack {
                    if selectedOption == nil {
                        Text("Selecionar...")
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("navBarColor"))
                            .padding(.horizontal, 8)
                    } else {
                        Text(selectedOption!.rawValue)
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
                ForEach(Frequency.allCases, id: \.self) { frequency in
                    HStack {
                        Text(frequency.rawValue)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 4)
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("ButtonThemeColor"))
                        Spacer()
                    }
                    .onTapGesture {
                        withAnimation {
                            self.selectedOption = frequency
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

struct FrequencyDropDownView: View {
    @Binding var selectedOption: Frequency?
    var body: some View {
        VStack(alignment: .leading) {
            Text("Frequência de Rega")
                .font(.custom("Satoshi-Regular", size: 12))
                .foregroundColor(Color("buttonCardColor"))
                .padding(.horizontal, 20)
            
            FrequencyDropDown(selectedOption: $selectedOption)
                .padding(.horizontal, 20)
        }
    }
}

struct FrequencyDropDown_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyDropDownView(selectedOption: .constant(.none))
    }
}

