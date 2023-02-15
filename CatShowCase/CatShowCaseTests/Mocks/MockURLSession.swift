//
//  MockURLSession.swift
//  CatShowCaseTests
//
//  Created by XIN LIU on 2/15/23.
//

import Foundation
@testable import CatShowCase

class MockURLSession: URLSessionProtocal {
    
    var result: (Data, URLResponse) = (Data(), URLResponse())
    
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        return result
    }
}
