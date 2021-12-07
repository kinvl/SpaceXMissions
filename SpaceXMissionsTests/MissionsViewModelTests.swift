//
//  MissionsViewModelTests.swift
//  SpaceXMissionsTests
//
//  Created by Krzysztof Kinal on 07/12/2021.
//

import XCTest
import Moya
@testable import SpaceXMissions

class MissionsViewModelTests: XCTestCase {
    
    var viewModel: MissionsViewModel!
    fileprivate var mockManager: Networkable!
    
    override func setUp() {
        super.setUp()
        self.mockManager = MockNetworkManager()
        self.viewModel = MissionsViewModel(withManager: mockManager)
        
    }
    
    override func tearDown() {
        self.mockManager = nil
        self.viewModel = nil
        super.tearDown()
    }
    
    func testCreateURLFromString() {
        viewModel.websiteURLFrom(URLString: "mock") { url, error in
            XCTAssertEqual(url, URL(string: "mock"))
            XCTAssertNil(error)
        }
    }
    
    func testFetchMissions() {
        viewModel.fetchMissions { error in
            XCTAssertNil(error)
        }
    }
    
    func testRequest() {
        let expectation = self.expectation(description: "request")
        _ = mockManager.provider.request(.getMission) { _ in
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5.0, handler: nil)
    }
}

fileprivate class MockNetworkManager: Networkable {
    
    var provider: MoyaProvider<SpaceX> = MoyaProvider<SpaceX>(stubClosure: MoyaProvider.immediatelyStub)
    
    func getMissions(completion: @escaping ([Mission]?, Error?) -> ()) {
        provider.request(.getMission) { result in
            switch result {
            case .success:
                completion([], nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
