//
//  MockCommentsRequest.swift
//  coding-test-appTests
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

struct MockCommentsRequest: RequestProtocol {
    var host: String {
        ""
    }
    
    var path: String {
        guard let path = Bundle.main.path(forResource: "commentsMock", ofType: "json") else { return "" }
        return path
    }
    
    var requestType: RequestType {
        .GET
    }
}
