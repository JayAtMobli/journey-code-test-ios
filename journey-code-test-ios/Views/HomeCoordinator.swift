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
    private let service: any ServiceProtocol
    @Published var postListViewModel: PostListViewModel!
    @Published var commentListViewModel: CommentListViewModel?

    
    // MARK: - Initialiser
    init(networkService: any ServiceProtocol) {
        self.service = networkService
        self.postListViewModel = .init(networkService: networkService, coordinator: self)
    }
}

extension HomeCoordinator {
    // MARK: - Functions
    func openCommentList(post: Post) {
        self.commentListViewModel = .init(selectedPost: post, networkService: self.service)
    }
}
