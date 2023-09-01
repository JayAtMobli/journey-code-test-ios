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
