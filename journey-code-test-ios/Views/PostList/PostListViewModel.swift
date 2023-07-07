//
//  PostListViewModel.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 8/07/23.
//

import Foundation

@MainActor
class PostListViewModel: ObservableObject {
    // MARK: - properties
    private let requestManager: any RequestManagerProtocol
    @Published private(set) var posts: [Post] = []
    
    // MARK: initialiser
    init(requestManager: any RequestManagerProtocol) {
        self.requestManager = requestManager
    }
    
    // MARK: functions
    func ready() {
        Task {
            await self.getPostList()
        }
    }
}

extension PostListViewModel {
    // MARK: api calls
    fileprivate func getPostList() async {
        let request = GetPostsRequest()
        let result: RequestResult<[Post]> = await requestManager.perform(request)
        switch result {
        case .success(let posts):
            self.posts = posts
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
