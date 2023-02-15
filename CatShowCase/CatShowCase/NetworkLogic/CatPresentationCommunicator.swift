//
//  CatPresentationCommunicator.swift
//  CatShowCase
//
//  Created by XIN LIU on 2/14/23.
//

import Foundation
import UIKit

/// Protocal for service request
protocol URLSessionProtocal {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocal {}

/// Network communicator which handles all network calls in this project
class CatPresentationCommunicator {
    
    struct Constant {
        /// network call url path
        struct Path {
            static let randomCatFact = "https://meowfacts.herokuapp.com/"
            static let randomCatPicture = "https://placekitten.com/"
        }
    }
    
    private let urlSession: URLSessionProtocal
    
    init(urlSession: URLSessionProtocal = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    /// Network call for getting one image using given width and height
    func getRandomCatPicture(width: Int, height: Int) async -> UIImage? {
        let url = URL(string: "\(Constant.Path.randomCatPicture)\(width)/\(height)")!
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await urlSession.data(for: request, delegate: nil)
            let image = UIImage(data: data)
            return image
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    /// Network call for getting one cat fact
    func getOneRandomCatFact() async -> String? {
        let url = URL(string: Constant.Path.randomCatFact)!
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await urlSession.data(for: request, delegate: nil)
            let fact = try JSONDecoder().decode(CatFactResponse.self, from: data)
            return fact.data?.first
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
