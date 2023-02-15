//
//  CatPresentationCommunicatorTests.swift
//  CatShowCaseTests
//
//  Created by XIN LIU on 2/15/23.
//

import XCTest
@testable import CatShowCase

final class CatPresentationCommunicatorTests: XCTestCase {
    
    private var mockURLSession: MockURLSession!
    private var communicator: CatPresentationCommunicator!
    
    override func setUp() {
        mockURLSession = MockURLSession()
        communicator = CatPresentationCommunicator(urlSession: mockURLSession)
    }
    
    func testGetCatFactSucceed() async {
        let catFact = CatFactResponse(data: ["one cat fact"])
        do {
            let data = try JSONEncoder().encode(catFact)
            mockURLSession.result = (data, URLResponse())
            let result = await communicator.getOneRandomCatFact()
            XCTAssertEqual("one cat fact", result)
        } catch {
            XCTFail()
        }
    }
    
    func testGetCatFactFailed() async {
        let result = await communicator.getOneRandomCatFact()
        XCTAssertNil(result)
    }
    
    func testGetCatPictureSucceed() async {
        let catImage = UIImage()
        guard let data = catImage.pngData() else {
            return
        }
        mockURLSession.result = (data, URLResponse())
        let result = await communicator.getRandomCatPicture(width: 20, height: 30)
        XCTAssertNotNil(result)
    }
    
    func testGetCatPictureFailed() async {
        let result = await communicator.getRandomCatPicture(width: 20, height: 30)
        XCTAssertNil(result)
    }

}
