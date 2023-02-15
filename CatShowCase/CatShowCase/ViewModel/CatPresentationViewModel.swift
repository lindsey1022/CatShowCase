//
//  CatPresentationViewModel.swift
//  CatShowCase
//
//  Created by XIN LIU on 2/15/23.
//

import Foundation
import UIKit

/// ViewModel for CatPresentationViewController
class CatPresentationViewModel {
    
    // MARK: - Properties
    
    private let logicController: CatPresentationLogicControllerProtocol
    
    var currentCatFact: String?
    var currentCatImage: UIImage?
    
    var navigationTitle: String {
        Bundle.main.localizedString(forKey: "Navigation_Title_Text")
    }
    
    var alertTitle: String {
        Bundle.main.localizedString(forKey: "Alert_Title_Text")
    }
    
    var okayButtonTitle: String {
        Bundle.main.localizedString(forKey: "OK_Button_Text")
    }
    
    var failedText: String {
        Bundle.main.localizedString(forKey: "Service_Failed_Message")
    }
    
    init(logicController: CatPresentationLogicControllerProtocol = CatPresentationLogicController.shared) {
        self.logicController = logicController
    }
    
    // MARK: - Functions
    
    private func getCatFact() async -> String? {
        return await logicController.getRandomCatFact()
    }
    
    private func getRandomCatPicture() async -> UIImage? {
        return await logicController.getRandomCatPicture()
    }
    
    /// Fetch new group of image/fact. If one of them failed, show alert and keep the current cat image/fact.
    func fetchNewCatInfo() async {
        let (fact, image) = await (getCatFact(), getRandomCatPicture())
        self.currentCatFact = fact
        self.currentCatImage = image
    }
}
