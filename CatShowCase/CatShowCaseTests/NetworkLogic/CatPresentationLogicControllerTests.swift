//
//  CatPresentationLogicController.swift
//  CatShowCaseTests
//
//  Created by XIN LIU on 2/15/23.
//

import XCTest
@testable import CatShowCase

final class CatPresentationLogicControllerTests: XCTestCase {
    private var communicator: MockCatPresentationCommunicator!
    private var logicController: CatPresentationLogicController!
    
    override func setUp() {
        communicator = MockCatPresentationCommunicator()
        logicController = CatPresentationLogicController.shared
        logicController.communicator = communicator
    }
    
    func testGetRandomCatFact() async {
        let testFact = "one cat fact"
        communicator.catFact = testFact
        let result = await logicController.getRandomCatFact()
        XCTAssertEqual(testFact, result)
    }
    
    func testGetRandomCatPicture() async {
        let testImage = UIImage(named: "test")
        communicator.catImage = testImage
        let result = await logicController.getRandomCatPicture()
        XCTAssertEqual(testImage, result)
    }
    
}
