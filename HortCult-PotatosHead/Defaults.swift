

import SwiftUI

class Defaults: ObservableObject {
    
    static let shared: Defaults = Defaults()
    var color: ColorScheme? {
        if theme == "Padrão do Sistema" {
           return nil
        } else if theme == "Claro" {
           return .light
       } else {
           return .dark
       }
   }
    
    @AppStorage ("theme") var themeStorage: String = "Padrão do Sistema"
    var theme: String { get {themeStorage} set {themeStorage = newValue} }
    
    @AppStorage ("enable-notification") var enableNotificationStorage: Bool = true
    var enableNotification: Bool { get {enableNotificationStorage} set {enableNotificationStorage = newValue} }
    
    @AppStorage ("time-notification") var timeNotificationStorage: String = "00:00"
    var timeNotification: String { get {timeNotificationStorage} set {timeNotificationStorage = newValue}}
}

