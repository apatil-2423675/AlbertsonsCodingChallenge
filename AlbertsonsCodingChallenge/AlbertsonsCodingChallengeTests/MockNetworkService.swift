//
//  MockNetworkService.swift
//  AlbertsonsCodingChallengeTests
//
//  Created by 2423675 on 18/04/23.
//

import XCTest
@testable import AlbertsonsCodingChallenge

class MockNetworkService: NetworkServiceProtocol {
    var getAcromineCalled = false
    var successResult = true
    var expectations: XCTestExpectation?
    
    /// Test mock network service result with custom success and failure responses.
    func getAcromine(param: Encodable) async -> Result<[AlbertsonsCodingChallenge.AcromineModel]?, AlbertsonsCodingChallenge.ServerError> {
        getAcromineCalled = true
        expectations?.fulfill()
        
        if successResult {
            return .success([AcromineModel(sf: "APP", lfs: nil)])
        }
        
        return .failure(ServerError.networkRespose)
    }
}
