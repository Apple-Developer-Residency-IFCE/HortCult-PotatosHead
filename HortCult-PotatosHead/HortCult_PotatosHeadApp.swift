//
//  HortCult_PotatosHeadApp.swift
//  HortCult-PotatosHead
//
//  Created by userext on 23/05/23.
//

import SwiftUI

@main
struct HortCult_PotatosHeadApp: App {
    
    @AppStorage ("isFirstLogin") static var isFirstLogin: Bool = true
    @ObservedObject var plantViewModel: PlantViewModel = PlantViewModel()
    @ObservedObject var notificationViewModel: NotificationViewModel = NotificationViewModel()
    var defaults = Defaults()
    var body: some Scene {
        WindowGroup {
            
            Button("adiciona - Planta"){
                plantViewModel.createPlant(name: "Batatào", category: "Boa Categoria", information: "É uma grande Planta", watering_frequency: "Todos os dias")
            }
            Button("adiciona - notificacao"){
                notificationViewModel.createNotification(next_time_to_alert: "10/10/2023", time_to_alert: "12:00", type_to_alert: "Regar")
            }
            Button("Lista Plantas"){
                plantViewModel.plants.forEach { Plant in
                    print("""
                    ID: \(Plant.id!)
                    Name: \(Plant.name!)
                    Category: \(Plant.category!)
                    Information? \(Plant.information!)
                    Watering_Frequency: \(Plant.watering_frequency!)
------------------------------------------------------------------------------------------

""")
                }
            }
            Button("Listas Notificaos"){
                notificationViewModel.notifications.forEach { Notification in
                    print("""
                    ID: \(Notification.id!)
                    Is_resolve: \(Notification.is_resolve)
                    nex_time_to_alert: \(Notification.next_time_to_alert!)
                    time_to_alert: \(Notification.time_to_alert!)
                    type_to_alert? \(Notification.type_to_alert!)
------------------------------------------------------------------------------------------

""")
                }
            }
            
            Button("edita - Plantas"){
                
                plantViewModel.updatePlant(plant: plantViewModel.plants.first!, name: "Editei", category: "Editei", information: "Editei", watering_frequency: "Editei")
                
            }
            Button("Edita notificacao"){
                notificationViewModel.updateNotification(notification: notificationViewModel.notifications.first!, next_time_to_alert: "Editou", time_to_alert: "Editou", type_to_alert: "Editou", is_resolve: true)
            }
            Button("Deleta Planta"){
                plantViewModel.deletePlant(plant: plantViewModel.plants.first!)
            }
            Button("Deleta Notificacao"){
                notificationViewModel.deleteNotification(notification: notificationViewModel.notifications.first!)
                
            }
            Button("Adiciona Notificacao na planta"){
                plantViewModel.addNotificationToPlant(plant: plantViewModel.plants.first!, notification: notificationViewModel.notifications.first!)
            }
            Button("Lista Notificaoes da primeira planta"){
                plantViewModel.plants.first!.plant_notification?.forEach({ Notification in
                    print("""
                    ID: \(String(describing: (Notification as AnyObject).id!))
                    Is_resolve: \(String(describing: (Notification as AnyObject).is_resolve))
                    nex_time_to_alert: \(String(describing: (Notification as AnyObject).next_time_to_alert!))
                    time_to_alert: \(String(describing: (Notification as AnyObject).time_to_alert!))
                    type_to_alert? \(String(describing: (Notification as AnyObject).type_to_alert!))
""")
                })
            }
        }
    }
}
