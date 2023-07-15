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
    private var service: ServiceProtocol
    @Published var postListViewModel: PostListViewModel!
    @Published var commentListViewModel: CommentListViewModel?

    
    // MARK: - Initialiser
    init(service: ServiceProtocol) {
        self.service = service
        self.postListViewModel = .init(service: service, coordinator: self)
    }
}

extension HomeCoordinator {
    // MARK: - Functions
    func openCommentList(post: Post) {
        self.commentListViewModel = .init(selectedPost: post, service: self.service)
    }
}
