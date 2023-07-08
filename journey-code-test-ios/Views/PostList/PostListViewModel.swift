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
    private unowned let coordinator: HomeCoordinator
    @Published private(set) var posts: [Post] = []
    var onPostSelection: (Post)->Void {
        return { [weak self] post in
            guard let self = self else { return }
            self.coordinator.openCommentList(post: post)
        }
    }
    
    // MARK: initialiser
    init(requestManager: any RequestManagerProtocol, coordinator: HomeCoordinator) {
        self.requestManager = requestManager
        self.coordinator = coordinator
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
