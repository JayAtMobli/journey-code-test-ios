//
//  PostListViewModel.swift
//  coding-test-app
//
//  Created by Jay Park on 8/07/23.
//

import Foundation

@MainActor
class PostListViewModel: ObservableObject {
    // MARK: - properties
    private var service: ServiceProtocol
    @Published private(set) var posts: [Post] = []
    
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
    init(service: ServiceProtocol) {
        self.service = service
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
