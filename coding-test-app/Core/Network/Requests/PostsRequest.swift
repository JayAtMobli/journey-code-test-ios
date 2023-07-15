//
//  PostsRequest.swift
//  coding-test-app
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
