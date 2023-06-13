

import SwiftUI

class Defaults: ObservableObject {
    @AppStorage ("theme") static var themeStorage: String = "Padrão do Sistema"
    @Published var theme: String = Defaults.themeStorage
    
    @AppStorage ("enable-notification") static var enableNotificationStorage: Bool = false
    @Published var enableNotification = Defaults.enableNotificationStorage
    
    @AppStorage ("time-notification") static var timeNotificationStorage: String = "00:00"
    @Published var timeNotification = Defaults.timeNotificationStorage
}
