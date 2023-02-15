//
//  MockCatPresentationLogicController.swift
//  CatShowCaseTests
//
//  Created by XIN LIU on 2/15/23.
//

import Foundation
import UIKit
@testable import CatShowCase

class MockCatPresentationLogicController: CatPresentationLogicControllerProtocol {
    var catImage: UIImage?
    var catFact: String?
    
    func getRandomCatFact() async -> String? {
        return catFact
    }
    
    func getRandomCatPicture() async -> UIImage? {
        return catImage
    }
}
