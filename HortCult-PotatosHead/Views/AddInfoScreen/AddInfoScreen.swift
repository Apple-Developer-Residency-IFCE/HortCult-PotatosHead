
import SwiftUI

struct AddInfoScreen: View {
    @State var isDisabled: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isSelectedTab = 0
    @State private var isNextScreenActive = false
    @State var nameText: String = ""
    @State var descriptionText: String = ""
    @State var category: Category?
    @State var frequency: Frequency?
    
    func verifyEmptyFields() -> Bool{
        if ((frequency != nil) && (category != nil) && nameText != "" && descriptionText != ""){
            return true
        }
        return false
    }
    
    var header: some View {
        ZStack{
            Image("Topbar")
            HStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                } ) {
                    Image("leftArrow")
                }
                .padding(.leading, 12)
                Spacer()
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView{
                    TextScreen(text: $nameText, description: $descriptionText)
                        .padding(.bottom, 20)
                    CategoryDropDownView(selectedOption: $category)
                        .padding(.bottom, 20)
                    FrequencyDropDownView(selectedOption: $frequency)
                        .padding(.bottom, 20)
                    ImagePickerComponentView()
                }
                CustomTabBar(action: { isSelectedTab = 0
                    isNextScreenActive = false
                },
                     actionTwo: {isSelectedTab = 1},
                     colorOne: isSelectedTab == 0 ? Color("tabBarSelectedItem") : Color("navBarColor"),
                     colorTwo: isSelectedTab == 1 ? Color("tabBarSelectedItem") : Color("navBarColor"))
                
                VStack{
                    Spacer()
                    AddButton(isDisabled: $isDisabled)
                        .padding(.bottom, 70)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarItems(leading: header)
    }
}

struct AddInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddInfoScreen()
    }
}



