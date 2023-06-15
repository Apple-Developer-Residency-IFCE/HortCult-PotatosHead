

import SwiftUI

class Defaults: ObservableObject {
    @AppStorage ("theme") static var themeStorage: Theme = .dark
    @Published var theme: Theme = Defaults.themeStorage
    
    @AppStorage ("enable-notification") static var enableNotificationStorage: Bool = true
    @Published var enableNotification = Defaults.enableNotificationStorage
    
    @AppStorage ("time-notification") static var timeNotificationStorage: String = "00:00"
    @Published var timeNotification = Defaults.timeNotificationStorage
}

