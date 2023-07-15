//
//  CommentListViewModel.swift
//  coding-test-app
//
//  Created by Jay Park on 8/07/23.
//

import Foundation

@MainActor
class CommentListViewModel: ObservableObject {
    // MARK: - properties
    private let selectedPost: Post
    private var service: ServiceProtocol
    @Published private(set) var comments: [Comment] = []
    
    // MARK: - search logic
    @Published var searchTerms: String = ""
    var filteredComments: [Comment] {
        guard !searchTerms.isEmpty else { return comments }
        return comments.filter { comment in
            (comment.name ?? "").lowercased().contains(searchTerms.lowercased()) ||
            (comment.email ?? "").lowercased().contains(searchTerms.lowercased()) ||
            (comment.body ?? "").lowercased().contains(searchTerms.lowercased())
        }
    }
    
    // MARK: initialiser
    init(selectedPost: Post, service: ServiceProtocol) {
        self.selectedPost = selectedPost
        self.service = service
    }
    
    // MARK: functions
    func ready() {
        guard comments.isEmpty else { return }
        Task {
            await getComments()
        }
    }
    
    func refresh() {
        Task {
            await getComments()
        }
    }
}


extension CommentListViewModel {
    // MARK: api calls
    func getComments() async {
        let result = await service.getComments(postId: selectedPost.id)
        switch result {
        case .success(let comments):
            self.comments = comments
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
