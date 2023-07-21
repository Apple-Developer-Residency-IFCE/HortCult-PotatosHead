import SwiftUI

class Defaults: ObservableObject {
//    static let defaultsShared = Defaults()
    @AppStorage ("theme") static var themeStorage: String = "Padrão do Sistema"
    @Published var theme: String = Defaults.themeStorage
    @AppStorage ("enable-notification") static var enableNotificationStorage: Bool = true
    @Published var enableNotification = Defaults.enableNotificationStorage
    @AppStorage ("time-notification") static var timeNotificationStorage: String = "00:00"
    @Published var timeNotification = Defaults.timeNotificationStorage
}
