
import SwiftUI

struct AddInfoScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isSelectedTab = 0
    @State private var isNextScreenActive = false
    @State var nameText: String = ""
    @State var descriptionText: String = ""
    @State var category: Category?
    @State var frequency: Frequency?
    @State var isDisabled: Bool = false
    
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
            VStack{
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
                    VStack{
                        Spacer()
                        if (!((frequency != nil) && (category != nil) && !nameText.isEmpty && !descriptionText.isEmpty)){
                            AddButton(isDisabled: true)
                        }
                        else {
                            AddButton(isDisabled: false)
                        }
                    }
                    .padding(.bottom, 60)
                }
                CustomTabBar(action: { isSelectedTab = 0
                    isNextScreenActive = false
                },
                             actionTwo: {isSelectedTab = 1},
                             colorOne: isSelectedTab == 0 ? Color("tabBarSelectedItem") : Color("navBarColor"),
                             colorTwo: isSelectedTab == 1 ? Color("tabBarSelectedItem") : Color("navBarColor"))
            }
            .padding(.bottom, 20)
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

