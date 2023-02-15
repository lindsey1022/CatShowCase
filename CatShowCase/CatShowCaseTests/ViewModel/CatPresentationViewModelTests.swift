//
//  CatPresentationViewModelTests.swift
//  CatShowCaseTests
//
//  Created by XIN LIU on 2/15/23.
//

import XCTest
@testable import CatShowCase

final class CatPresentationViewModelTests: XCTestCase {
    
    private var viewModel: CatPresentationViewModel!
    private var logicController: MockCatPresentationLogicController!
    
    override func setUp() {
        logicController = MockCatPresentationLogicController()
        viewModel = CatPresentationViewModel(logicController: logicController)
    }
    
    func testFetchNewCatInfoFailed() async {
        await viewModel.fetchNewCatInfo()
        XCTAssertNil(viewModel.currentCatFact)
    }
    
    func testFetchNewCatInfoSucceed() async {
        logicController.catFact = "one cat fact"
        logicController.catImage = UIImage()
        await viewModel.fetchNewCatInfo()
        XCTAssertEqual("one cat fact", viewModel.currentCatFact)
    }
}
