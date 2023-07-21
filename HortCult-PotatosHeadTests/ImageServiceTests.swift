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
       imageService = nil
        try super.tearDownWithError()
    }
    func testCreateImage() throws {
        let image = ImageService.instance.createImage(plantImage: Data())
        XCTAssertNotNil(image)
        XCTAssertNotNil(image?.id)
        XCTAssertNotNil(image?.plant_image)
    }

    func testDeleteImage() throws {
        let image = ImageService.instance.createImage(plantImage: Data())
        ImageService.instance.deleteImage(plantImage: image!)
        let fetchedImages = ImageService.instance.hortcultImages
        XCTAssertFalse(fetchedImages.contains(image!))
    }

    func testUpdateImage() throws {
        // Create an image.
        let image = ImageService.instance.createImage(plantImage: Data())

        // Get the image ID.
        let imageID = image?.id

        // Update the image.
        let updatedImage = Data()
        ImageService.instance.updateImage(plantImage: imageID, updatedImage: updatedImage)

        // Fetch the updated image.
        let fetchedImage = ImageService.instance.hortcultImages.first(where: { $0.id == imageID })

        // Check that the updated image is correct.
        XCTAssertEqual(fetchedImage?.plant_image, updatedImage)
    }
}
