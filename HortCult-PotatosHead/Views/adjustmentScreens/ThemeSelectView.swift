

import SwiftUI



struct ThemeSelect: View {
    @EnvironmentObject var defaults: Defaults
    @State var selectedOption: String
    @Environment(\.presentationMode) var presentationMode
    

    var header: some View {
        ZStack{
            HStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                } ) {
                    Image("leftArrow")
                }
                .padding(.leading, 12).padding(.trailing, -8)
                Text("Ajustes").foregroundColor(Color("MainColor")).font(.custom("Satoshi-Regular", size: 16))
                Spacer()
            }
        }
    }
    
        var body: some View {
            NavigationView {
                VStack {
                    HStack{
                        Text("Tema")
                            .font(.custom("Satoshi-Bold", size: 28))
                            .foregroundColor(Color("MainColor"))
                            .padding(.top, 20)
                        Spacer()
                    }.padding(.bottom, 40).padding(.top, 40)
                    
                    
                    RadioButton(selectedOption: $selectedOption, action: {
                        defaults.theme = "Claro"
                        Defaults.themeStorage = "Claro"
                    }, title: "Claro").padding(.bottom, 16)
                    
                    RadioButton(selectedOption: $selectedOption, action: {
                        defaults.theme = "Escuro"
                        Defaults.themeStorage = "Escuro"
                    }, title: "Escuro").padding(.bottom, 16)
                    
                    RadioButton(selectedOption: $selectedOption, action: {
                        defaults.theme = "Padrão do Sistema"
                        Defaults.themeStorage = "Padrão do Sistema"
                    }, title: "Padrão do Sistema").padding(.bottom, 16)

                    Spacer()
                }.padding(.leading, 24)
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("")
            .navigationBarItems(leading: header)
            }
            
}

struct ThemeSelect_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSelect(selectedOption: Defaults().theme)
            .environmentObject(Defaults())
    }
}
