//
//  CommentsRequest.swift
//  journey-code-test-ios
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
