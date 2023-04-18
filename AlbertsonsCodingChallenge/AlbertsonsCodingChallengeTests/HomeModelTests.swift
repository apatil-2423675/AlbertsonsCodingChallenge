//
//  HomeModelTests.swift
//  AlbertsonsCodingChallengeTests
//
//  Created by 2423675 on 18/04/23.
//

import XCTest
@testable import AlbertsonsCodingChallenge

final class HomeModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAcronymData_Success() {
        // Arrange
        let mockNetworkService = MockNetworkService()
        let homeViewModel = HomeViewModel(networkService: mockNetworkService)
        
        // Create an expectation for an asynchronous task.
        let expectation = XCTestExpectation(description: "ViewModel test success")
        mockNetworkService.expectations = expectation
        
        // Act
        homeViewModel.getAcromine(sf: "APP")
        wait(for: [expectation], timeout: 10.0)
        
        // Assert
        XCTAssertTrue(mockNetworkService.getAcromineCalled)
        XCTAssertNotNil(homeViewModel.acromineModel)
        XCTAssertTrue(homeViewModel.acromineModel.count > 0)
    }
    
    func testAcronymData_Failure() {
        // Arrange
        let mockNetworkService = MockNetworkService()
        mockNetworkService.successResult = false
        let homeViewModel = HomeViewModel(networkService: mockNetworkService)
        
        // Create an expectation for an asynchronous task.
        let expectation = XCTestExpectation(description: "ViewModel test failure")
        mockNetworkService.expectations = expectation
        
        // Act
        homeViewModel.getAcromine(sf: "A")
        wait(for: [expectation], timeout: 10.0)
        
        // Assert
        XCTAssertTrue(mockNetworkService.getAcromineCalled)
        XCTAssertTrue(homeViewModel.acromineModel.isEmpty)
    }

}
