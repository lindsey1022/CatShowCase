//
//  MockCatPresentationCommunicator.swift
//  CatShowCaseTests
//
//  Created by XIN LIU on 2/15/23.
//

import Foundation
import UIKit
@testable import CatShowCase

class MockCatPresentationCommunicator: CatPresentationCommunicator {
    var catImage: UIImage?
    var catFact: String?
    
    override func getRandomCatPicture(width: Int, height: Int) async -> UIImage? {
        return catImage
    }
    
    override func getOneRandomCatFact() async -> String? {
        return catFact
    }
}
