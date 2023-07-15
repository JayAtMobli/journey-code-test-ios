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
    private var service: ServiceProtocol
    private unowned let coordinator: HomeCoordinator
    @Published private(set) var posts: [Post] = []
    var onPostSelection: (Post)->Void {
        return { [weak self] post in
            guard let self = self else { return }
            self.coordinator.openCommentList(post: post)
        }
    }
    
    // MARK: - search logic
    @Published var searchTerms: String = ""
    var filteredPosts: [Post] {
        guard !searchTerms.isEmpty else { return posts }
        return posts.filter { post in
            (post.title ?? "").lowercased().contains(searchTerms.lowercased()) ||
            (post.body ?? "").lowercased().contains(searchTerms.lowercased())
        }
    }
    
    // MARK: initialiser
    init(service: ServiceProtocol, coordinator: HomeCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    // MARK: functions
    func ready() {
        guard posts.isEmpty else { return }
        Task {
            await getPosts()
        }
    }
    
    func refresh() {
        Task {
            await getPosts()
        }
    }
}

extension PostListViewModel {
    // MARK: api calls
    func getPosts() async {
        let result = await service.getPostList()
        switch result {
        case .success(let posts):
            self.posts = posts
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
