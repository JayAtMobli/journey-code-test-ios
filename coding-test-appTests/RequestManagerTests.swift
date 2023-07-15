//
//  RequestManagerTests.swift
//  coding-test-appTests
//
//  Created by Jay Park on 7/07/23.
//

import XCTest
@testable import coding_test_app

final class RequestManagerTests: XCTestCase {
    private var requestManager: RequestManager!
    
    override func setUpWithError() throws {
        let dataParser = DataParser()
        let apiManager = MockApiManager()
        
        requestManager = RequestManager(
            apiManager: apiManager,
            parser: dataParser
        )
    }
    
    func testGetPosts() async throws {

            let request = MockPostRequest()
            let result: Result<[Post], Error> = await requestManager.perform(request)
            
            switch result {
            case .success(let posts):
                XCTAssertEqual(posts.count, 100)
            case .failure(let error):
                XCTFail("Didn't get data from the request manager \(error))")
            }

        
    }
    
    func testGetComments() async throws {

            let request = MockCommentsRequest()
            let result: Result<[Comment], Error> = await requestManager.perform(request)
            
            switch result {
            case .success(let comments):
                XCTAssertEqual(comments.count, 5)
            case .failure(let error):
                XCTFail("Didn't get data from the request manager \(error))")
            }

        
    }
}
