
import SwiftUI

struct RadioButton: View {
    
    @Binding var selectedOption: String
    var action: (() -> Void)
    
    var title: String
    var body: some View {
        HStack{
            Button(action: {
                selectedOption = title
                action()
            }) {
                HStack {
                    Image(selectedOption == title ? "option_selected" : "option_unselected")
                    Text(title)
                }
            }.foregroundColor(.primary)
        Spacer()
        }

    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton(selectedOption: .constant("Claro"), action: {}, title: "Claro")
    }
}
