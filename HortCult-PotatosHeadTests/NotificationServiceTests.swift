//
//  HortCult_PotatosHeadTests.swift
//  HortCult-PotatosHeadTests
//
//  Created by Caio Vinicius on 19/07/23.
//

import XCTest
@testable import HortCult_PotatosHead

class NotificationServiceTests: XCTestCase {
    var notificationService: NotificationService!
    override func setUpWithError() throws {
        try super.setUpWithError()
        notificationService = NotificationService.instance
    }
    override func tearDownWithError() throws {
        notificationService = nil
        try super.tearDownWithError()
    }
    // Teste para verificar se a função createNotification cria uma notificação corretamente
    func testCreateNotification() throws {
        let nextTimeToAlert = "15/07/2023"
        let timeToAlert = "08:00"
        let typeToAlert = "Watering"
        let notification = notificationService.createNotification(nextTimeToAlert: nextTimeToAlert,
                                                                  timeToAlert: timeToAlert,
                                                                  typeToAlert: typeToAlert)
        XCTAssertNotNil(notification, "A notificação não deveria ser nula")
        let notificationID = notification?.id
        if let notificationInList = notificationService.notifications.first(where: { $0.id == notificationID }) {
            XCTAssertTrue(notificationInList == notification,
                          "A notificação criada deve ser igual à notificação na lista")
        } else {
            XCTFail("A notificação não foi encontrada na lista")
        }
    }
    // Teste para verificar se a função deleteNotification remove uma notificação corretamente
    func testDeleteNotification() throws {
        let notification = notificationService.createNotification(
            nextTimeToAlert: "15/07/2023",
            timeToAlert: "08:00",
            typeToAlert: "Watering")
        XCTAssertNotNil(notification, "A notificação não deveria ser nula")
        let notificationID = notification?.id
        if let notificationInList = notificationService.notifications.first(where: { $0.id == notificationID }) {
            notificationService.deleteNotification(notification: notificationInList)
            XCTAssertTrue(notificationService.notifications.first(where: { $0.id == notificationID }) == nil,
                          "A notificação não deveria existir após a remoção")
        } else {
            XCTFail("A notificação não foi encontrada na lista")
        }
    }
    // Teste para verificar se a função updateNotification atualiza corretamente os valores de uma notificação
    func testUpdateNotification() throws {
        let notification = notificationService.createNotification(nextTimeToAlert: "15/07/2023",
                                                                  timeToAlert: "08:00",
                                                                  typeToAlert: "Watering")
        XCTAssertNotNil(notification, "A notificação não deveria ser nula")
        let newNextTimeToAlert = "20/07/2023"
        let newTimeToAlert = "12:00"
        let newTypeToAlert = "Fertilizing"
        let newIsResolved = true
        notificationService.updateNotification(notification: notification!,
                                               nextTimeToAlert: newNextTimeToAlert,
                                               timeToAlert: newTimeToAlert,
                                               typeToAlert: newTypeToAlert,
                                               isResolve: newIsResolved)
        let notificationID = notification?.id
        if let notificationInList = notificationService.notifications.first(where: { $0.id == notificationID }) {
            XCTAssertTrue(notificationInList == notification,
                          "A notificação criada deve ser igual à notificação na lista")
            XCTAssertEqual(notificationInList.next_time_to_alert,
                           newNextTimeToAlert,
                           "O próximo horário de alerta deve ser igual a 20/07/2023 após a atualização")
            XCTAssertEqual(notificationInList.time_to_alert,
                           newTimeToAlert,
                           "O horário do alerta deve ser igual a 12:00 após a atualização")
            XCTAssertEqual(notificationInList.type_to_alert,
                           newTypeToAlert,
                           "O tipo de alerta deve ser igual a Fertilizing após a atualização")
            XCTAssertEqual(notificationInList.is_resolve,
                           newIsResolved,
                           "O status de resolução deve ser true após a atualização")
        } else {
            XCTFail("A notificação não foi encontrada na lista")
        }
    }
    // Teste para verificar se a função getUnresolvedsNotification está fucionando
    func testGetUnresolvedsNotifications() throws {
        let notification1 = Notification(context: notificationService.viewContext)
        notification1.next_time_to_alert = "2023-07-15"
        notification1.time_to_alert = "08:00"
        notification1.type_to_alert = "Watering"
        notification1.is_resolve = false

        let notification2 = Notification(context: notificationService.viewContext)
        notification2.next_time_to_alert = "2023-07-16"
        notification2.time_to_alert = "12:00"
        notification2.type_to_alert = "Watering"
        notification2.is_resolve = true

        let unresolvedNotifications = notificationService.getUnresolvedsNotifications()
        for notification in unresolvedNotifications {
            XCTAssertFalse(notification.is_resolve)
        }
    }
    // Teste para verificar se a função calculateNextWatering calcula corretamente o próximo horário de rega
    func testCalculateNextWatering() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dailyNextWatering = notificationService.calculateNextWatering(wateringFrequency: .daily)
        let everyTwoDaysNextWatering = notificationService.calculateNextWatering(wateringFrequency: .everyTwoDays)
        let everyFourDaysNextWatering = notificationService.calculateNextWatering(wateringFrequency: .everyFourDays)
        let weeklyNextWatering = notificationService.calculateNextWatering(wateringFrequency: .weekly)
        let expectedDailyNextWatering = dateFormatter.string(
            from: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
        let expectedEveryTwoDaysNextWatering = dateFormatter.string(
            from: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
        let expectedEveryFourDaysNextWatering = dateFormatter.string(
            from: Calendar.current.date(byAdding: .day, value: 4, to: Date())!)
        let expectedWeeklyNextWatering = dateFormatter.string(
            from: Calendar.current.date(byAdding: .day, value: 7, to: Date())!)
        XCTAssertEqual(dailyNextWatering, expectedDailyNextWatering,
                       "O próximo horário de rega diário deve ser 1 dia após a data atual")
        XCTAssertEqual(everyTwoDaysNextWatering, expectedEveryTwoDaysNextWatering,
                       "O próximo horário de rega a cada 2 dias deve ser 2 dias após a data atual")
        XCTAssertEqual(everyFourDaysNextWatering, expectedEveryFourDaysNextWatering,
                       "O próximo horário de rega a cada 4 dias deve ser 4 dias após a data atual")
        XCTAssertEqual(weeklyNextWatering, expectedWeeklyNextWatering,
                       "O próximo horário de rega semanal deve ser 7 dias após a data atual")
    }
}
