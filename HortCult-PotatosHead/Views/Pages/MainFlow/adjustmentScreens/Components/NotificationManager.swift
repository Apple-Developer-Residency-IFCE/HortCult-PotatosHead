import SwiftUI
import UserNotifications

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}

struct NotificationManager: View {
    @State private var isPressed = false
    @State private var notificationTime = Date()
    @State private var isTimePickerVisible = false
    private let notificationDelegate = NotificationDelegate()
    @State private var notificationIdentifier: String?
    let identifier = "Notification"
    @State private var shouldUpdateNotification = false


    
    var body: some View {
        VStack {
            Button(action: {
                isTimePickerVisible = true
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(Color("hourButton"), lineWidth: 1)
                    
                    HStack {
                        Text(dateFormatter.string(from: notificationTime))
                            .font(.custom("Satoshi-Regular", size: 12))
                            .padding(.horizontal)
                            .foregroundColor(isPressed ? Color.clear : Color("TextColor"))
                        
                        Spacer()
                        
                        Image("Clock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .padding(.horizontal)
                            .foregroundColor(isPressed ? Color.clear : Color("TextColor"))
                    }
                }
                .frame(width: 350, height: 35)
            }
            .sheet(isPresented: $isTimePickerVisible) {
                TimePickerView(notificationTime: $notificationTime)
                    .onDisappear {
                        updateNotificationTime()
                    }
            }
        }
        .onAppear {
            loadNotificationTime()
            requestNotificationAuthorization()
            UNUserNotificationCenter.current().delegate = notificationDelegate

            NotificationCenter.default.addObserver(forName: NSNotification.Name("updateNotification"), object: nil, queue: nil) { _ in
                updateNotification()
            }
        }
    }
    
    func loadNotificationTime() {
        if let savedTime = UserDefaults.standard.object(forKey: "NotificationTime") as? Date {
            notificationTime = savedTime
        }
        
    }
    
    func updateNotificationTime() {
        UserDefaults.standard.set(notificationTime, forKey: "NotificationTime")
        print("Horário de notificação atualizado:", dateFormatter.string(from: notificationTime))
        
        shouldUpdateNotification = true
    }
    
    func updateNotification() {
        guard shouldUpdateNotification else {
            return
        }
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
        scheduleNotification()
        
        shouldUpdateNotification = false
    }
    
    func requestNotificationAuthorization() {
        if Defaults.enableNotificationStorage == false {
            print("Notificações desabilitadas")
            
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
            notificationIdentifier = nil
            
            return
        }

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                scheduleNotification()
                Defaults.enableNotificationStorage = true

            } else {
                print("Permissão de notificação negada")
            }
        }
    }

    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "HortCult"
        content.body = "Está na hora de regar a sua plantinha!"
        content.sound = UNNotificationSound.default
        
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Erro ao agendar notificação: \(error.localizedDescription)")
            } else {
                print("Notificação agendada para \(dateFormatter.string(from: notificationTime))")
                self.notificationIdentifier = identifier
            }
        }
    }

}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    formatter.locale = Locale(identifier: "pt_BR")
    return formatter
}()

struct TimePickerView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var notificationTime: Date
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Selecione um horário", selection: $notificationTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(.wheel)
                    .accentColor(.purple)
                    .environment(\.locale, Locale(identifier: "pt_BR"))
                
                Button(action: {
                    Defaults.enableNotificationStorage = true
                    presentationMode.wrappedValue.dismiss()
                    NotificationCenter.default.post(name: NSNotification.Name("updateNotification"), object: nil)
                }) {
                    Text("Concluir")
                        .font(.custom("Satoshi-Bold", size: 20))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("MainColor"))
                        .foregroundColor(Color("backgroundColor"))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .navigationBarTitle(Text("Horário de Notificação"), displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancelar")
                    .foregroundColor(Color("MainColor"))
                    .font(.custom("Satoshi-Regular", size: 18))
            }
            )
        }
    }
}

struct NotificationManager_Previews: PreviewProvider {
    static var previews: some View {
        NotificationManager()
    }
}
