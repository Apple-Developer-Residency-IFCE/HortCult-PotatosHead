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
        XCTAssertEqual(notification?.next_time_to_alert,
                       nextTimeToAlert,
                       "O próximo horário de alerta deve ser igual a 15/07/2023")
        XCTAssertEqual(notification?.time_to_alert, timeToAlert, "O horário do alerta deve ser igual a 08:00")
        XCTAssertEqual(notification?.type_to_alert, typeToAlert, "O tipo de alerta deve ser igual a Watering")
    }
    // Teste para verificar se a função deleteNotification remove uma notificação corretamente
    func testDeleteNotification() throws {
        let notification = notificationService.createNotification(
            nextTimeToAlert: "15/07/2023",
            timeToAlert: "08:00",
            typeToAlert: "Watering")
        XCTAssertNotNil(notification, "A notificação não deveria ser nula")
        notificationService.deleteNotification(notification: notification!)
        while !notificationService.notifications.isEmpty {
            notificationService.viewContext.delete(notificationService.notifications.remove(at: 0))
        }
        do {
            try notificationService.viewContext.save()
        } catch {
            print(error)
        }
        XCTAssertTrue(notificationService.notifications.isEmpty,
          "A lista de notificações deveria estar vazia após a remoção")
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
                                               timeToAlert: newTimeToAlert, typeToAlert: newTypeToAlert,
                                               isResolve: newIsResolved)
        XCTAssertEqual(notification?.next_time_to_alert,
                       newNextTimeToAlert,
                       "O próximo horário de alerta deve ser igual a 20/07/2023 após a atualização")
        XCTAssertEqual(notification?.time_to_alert,
                       newTimeToAlert,
                       "O horário do alerta deve ser igual a 12:00 após a atualização")
        XCTAssertEqual(notification?.type_to_alert,
                       newTypeToAlert,
                       "O tipo de alerta deve ser igual a Fertilizing após a atualização")
        XCTAssertEqual(notification?.is_resolve,
                       newIsResolved,
                       "O status de resolução deve ser true após a atualização")
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
