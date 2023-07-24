//
//  PlantServiceTests.swift
//  HortCult-PotatosHeadTests
//
//  Created by Yohanne Moreira on 21/07/23.
//

import XCTest
@testable import HortCult_PotatosHead
// swiftlint:disable all
class PlantServiceTests: XCTestCase {
    var plantService: PlantService!
    override func setUpWithError() throws {
        try super.setUpWithError()
//  let -> variável não vai ser alterado durante os testes
        _ =  PlantService.instance
    }
// The tearDownWithError() method is a critical part of unit testing.
// It ensures that the environment for each unit test is restored to its original state,
// which helps to ensure that the unit tests are reliable.
    override func tearDownWithError() throws {
//        try super.tearDownWithError()
//            plantService = nil
    }

    func testCreatePlant() throws {
    // 1. Given
        let name = "Hortelã"
        let category = "Hortaliça"
        let information = "Tem muita balinha desse sabor"
        let wateringFrequency = "Diária"
    // 2. When
        // swiftlint:disable all
        let plant = plantService.createPlant(name: name, category: category, information: information, wateringFrequency: wateringFrequency)
    // 3. then
        XCTAssertEqual(plant?.name, "Hortelã", "Nome não encontrado")
        XCTAssertEqual(plant?.category, "Hortaliça", "Categoria não encontrada")
        XCTAssertEqual(plant?.information, "Tem muita balinha desse sabor", "Descrição não encontrada")
        XCTAssertEqual(plant?.watering_frequency, "Diária", "Frequência não encontrada")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
