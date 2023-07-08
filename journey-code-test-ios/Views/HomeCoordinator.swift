//
//  HomeCoordinator.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 8/07/23.
//

import Foundation

@MainActor
class HomeCoordinator: ObservableObject {
    // MARK: - Properties
    private let requestManager: any RequestManagerProtocol
    @Published var postListViewModel: PostListViewModel!
    @Published var commentListViewModel: CommentListViewModel?

    
    // MARK: - Initialiser
    init(requestManager: any RequestManagerProtocol) {
        self.requestManager = requestManager
        self.postListViewModel = .init(requestManager: requestManager, coordinator: self)
    }
}

extension HomeCoordinator {
    func openCommentList(post: Post) {
        self.commentListViewModel = .init(selectedPost: post, requestManager: self.requestManager)
    }
}
