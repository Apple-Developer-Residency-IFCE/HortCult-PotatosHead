//
//  ImageServiceTests.swift
//  HortCult-PotatosHeadTests
//
//  Created by Caio Vinicius on 20/07/23.
//

import XCTest
@testable import HortCult_PotatosHead

final class ImageServiceTests: XCTestCase {
    var imageService: ImageService!
    override func setUpWithError() throws {
        try super.setUpWithError()
        imageService = ImageService.instance
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        imageService = nil
    }
    func testCreateImage() throws {
        let image = imageService.createImage(plantImage: Data())
        XCTAssertNotNil(image)
        XCTAssertNotNil(image?.id)
        XCTAssertNotNil(image?.plant_image)
    }

    func testDeleteImage() throws {
        let image = imageService.createImage(plantImage: Data())
        imageService.deleteImage(plantImage: image!)
        let fetchedImages = imageService.hortcultImages
        XCTAssertFalse(fetchedImages.contains(image!))
    }

    func testUpdateImage() throws {
        // Criando uma imagem e convertendo-a para Data, formato o qual é o esperado.
        let image = UIImage(named: "Tomate")
        let imageData = image?.pngData()

        // Criando uma nova imagem a partir do método createImage.
        let newImage = imageService.createImage(plantImage: imageData!)

        // Validação para ver se a imagem foi criada.
        XCTAssertNotNil(newImage, "Failed to create a new image.")

        // Criando uma nova imagem para utilizar o método de update.
        let updatedImage = UIImage(named: "Abobrinha")
        let updatedImageData = updatedImage?.pngData()

        // Aplicando o método a ser testado
        imageService.updateImage(plantImage: newImage!, updatedImage: updatedImageData!)

        // Buscando a imagem pelo id para verificar se ela está realmente no contexto.
        let updatedImageFromCoreData = imageService.hortcultImages.first { $0.id == newImage?.id }

        // Checando se a imagem realmente foi criada e se é a mesma criada no banco.
        XCTAssertNotNil(updatedImageFromCoreData, "Imagem atualizada não foi encontrada no contexto")
        XCTAssertEqual(updatedImageFromCoreData?.plant_image, updatedImageData, "A imagem não conseguiu ser atualizada")
    }
}
