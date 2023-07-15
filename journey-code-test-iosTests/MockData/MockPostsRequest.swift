//
//  MockPostsRequest.swift
//  journey-code-test-iosTests
//
//  Created by Jay Park on 7/07/23.
//

import Foundation
@testable import journey_code_test_ios

struct MockPostRequest: RequestProtocol {
    var host: String {
        ""
    }
    
    var path: String {
        guard let path = Bundle.main.path(forResource: "postsMock", ofType: "json") else { return "" }
        return path
    }
    
    var requestType: RequestType {
        .GET
    }
}
