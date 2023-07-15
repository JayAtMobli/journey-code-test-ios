//
//  CommentListViewModel.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 8/07/23.
//

import Foundation

@MainActor
class CommentListViewModel: ObservableObject {
    // MARK: - properties
    private let selectedPost: Post
    private let service: any ServiceProtocol
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
    init(selectedPost: Post, networkService: any ServiceProtocol) {
        self.selectedPost = selectedPost
        self.service = networkService
    }
    
    // MARK: functions
    func ready() {
        guard comments.isEmpty else { return }
        getComments()
    }
    
    func refresh() {
        getComments()
    }
}


extension CommentListViewModel {
    // MARK: api calls
    fileprivate func getComments() {
        Task {
            let result = await service.getComments(postId: selectedPost.id)
            switch result {
            case .success(let comments):
                self.comments = comments
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
