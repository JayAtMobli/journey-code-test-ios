//
//  NetworkService.swift
//  coding-test-app
//
//  Created by Jay Park on 15/07/23.
//

import Foundation

protocol ServiceProtocol {
    func getPostList() async -> RequestResult<[Post]>
    func getComments(postId: Int) async -> RequestResult<[Comment]>
}

class NetworkService: ServiceProtocol {
    private let requestManager: RequestManager
    
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    func getPostList() async -> RequestResult<[Post]> {
        let request = GetPostsRequest()
        let result: RequestResult<[Post]> = await requestManager.perform(request)
        return result
    }
    
    func getComments(postId: Int) async -> RequestResult<[Comment]> {
        let params = ["postId":"\(postId)"]
        let request = GetCommentsRequest(parameters: params)
        let result: RequestResult<[Comment]> = await requestManager.perform(request)
        return result
    }
}
