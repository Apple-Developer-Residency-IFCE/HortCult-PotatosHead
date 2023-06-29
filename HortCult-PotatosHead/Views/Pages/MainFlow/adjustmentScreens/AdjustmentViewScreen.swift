import SwiftUI
import UserNotifications

struct AdjustmentView: View {
    @EnvironmentObject var defaults: Defaults
    @State var theme: String = Defaults.themeStorage
    @State var switcherOn: Bool = Defaults.enableNotificationStorage
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
                        ThemeSelect(selectedOption: Defaults.themeStorage)
                            .environmentObject(defaults)
                        
                    } label: {
                        AdjustmentItem(label: "Tema") {
                            NavigationIconView(label: Defaults.themeStorage)
                        }
                    }
                    
                    Divider()
                    AdjustmentItem(label: "Notificações Push") {
                        Toggle("", isOn: $switcherOn).onChange(of: switcherOn, perform: { newValue in
                            Defaults.enableNotificationStorage = newValue
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
            .environmentObject(Defaults())
    }
}
