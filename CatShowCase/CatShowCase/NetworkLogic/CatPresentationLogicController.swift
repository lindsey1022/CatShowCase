//
//  CatPresentationLogicController.swift
//  CatShowCase
//
//  Created by XIN LIU on 2/14/23.
//

import Foundation
import UIKit

protocol CatPresentationLogicControllerProtocol: AnyObject {
    func getRandomCatFact() async -> String?
    func getRandomCatPicture() async -> UIImage?
}

/// Class used for handle all logic before making a network call
class CatPresentationLogicController: CatPresentationLogicControllerProtocol {
    
    static let shared = CatPresentationLogicController()
    
    var communicator: CatPresentationCommunicator!
    
    private init() {
        self.communicator = CatPresentationCommunicator()
    }
    
    /// Get one random cat fact
    func getRandomCatFact() async -> String? {
        let result = await communicator.getOneRandomCatFact()
        return result
    }
    
    /// Get one cat picture, using random generated number as image size
    func getRandomCatPicture() async -> UIImage? {
        let randomWidth = Int.random(in: 100...300)
        let randomHeight = Int.random(in: 100...400)
        return await communicator.getRandomCatPicture(width: randomWidth, height: randomHeight)
    }
}
