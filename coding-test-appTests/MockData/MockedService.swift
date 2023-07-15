//
//  MockedService.swift
//  journey-code-test-iosTests
//
//  Created by Jay Park on 15/07/23.
//

import Foundation
@testable import journey_code_test_ios

class MockedService: ServiceProtocol {
    private let requestManager: RequestManager
    
    init(requestManager: RequestManager = RequestManager(apiManager: MockApiManager())) {
        self.requestManager = requestManager
    }
    
    func getPostList() async -> RequestResult<[Post]> {
        let request = MockPostRequest()
        let result: RequestResult<[Post]> = await requestManager.perform(request)
        return result
    }

    func getComments(postId: Int) async -> RequestResult<[Comment]> {
        let request = MockCommentsRequest()
        let result: RequestResult<[Comment]> = await requestManager.perform(request)
        return result
    }
}
