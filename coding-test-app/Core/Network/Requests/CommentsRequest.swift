//
//  CommentsRequest.swift
//  coding-test-app
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

struct GetCommentsRequest: RequestProtocol {
    var path: String {
        "/comments"
    }
    
    var requestType: RequestType {
        .GET
    }
    
    var urlParams: [String : String?] {
        parameters ?? [:]
    }
    
    var parameters: [String : String?]?
}

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
