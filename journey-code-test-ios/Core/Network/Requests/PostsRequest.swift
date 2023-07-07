//
//  PostsRequest.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

struct GetPostsRequest: RequestProtocol {
    var path: String {
        "/posts"
    }
    
    var requestType: RequestType {
        .GET
    }
}
