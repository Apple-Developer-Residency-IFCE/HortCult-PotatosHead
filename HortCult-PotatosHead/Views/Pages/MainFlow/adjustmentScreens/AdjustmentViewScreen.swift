import SwiftUI
import UserNotifications

struct AdjustmentView: View {
    @State var theme: String = Defaults.shared.themeStorage
    @State var switcherOn: Bool = Defaults.shared.enableNotificationStorage
    @State var timeToAlert: String = ""
    @State var time: Date = Date()
    @State var openConfia: Bool = true
    @State private var showNextScreen: Bool = false
    
    
    
    var body: some View {
        NavigationView {
            VStack{
                
                Group{
                    HStack {
                        Text("Ajustes")
                            .font(.custom("Satoshi-Bold", size: 28))
                            .foregroundColor(Color("MainColor"))
                            .padding(.top, 20)
                        Spacer()

                    }
                    NavigationLink {
                        ThemeSelect(selectedOption: Defaults.shared.themeStorage)
                        
                    } label: {
                        AdjustmentItem(label: "Tema") {
                            NavigationIconView(label: Defaults.shared.themeStorage)
                        }
                    }
                    
                    Divider()
                    AdjustmentItem(label: "Notificações Push") {
                        Toggle("", isOn: $switcherOn).onChange(of: switcherOn, perform: { newValue in
                            Defaults.shared.enableNotificationStorage = newValue
                            NotificationManager().requestNotificationAuthorization()
                        })
                    }
                    
                    Divider()
                    
                    if (switcherOn){
                        VStack {
                            HStack{
                                Text("Notificaçoes")
                                Spacer()
                            }
                            VStack{
                                HStack{
                                    Text("Horários")
                                        .font(.custom("Satoshi-Regular", size: 12))
                                        .foregroundColor(Color("title"))
                                        .padding(.bottom, 6)
                                    Spacer()
                                }

                                NotificationManager()
                            }.padding(.top, 24)


                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
            }
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct AdjustmentView_Previews: PreviewProvider {
    static var previews: some View {
        AdjustmentView()
    }
}
