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
    private let requestManager: any RequestManagerProtocol
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
    init(selectedPost: Post, requestManager: any RequestManagerProtocol) {
        self.selectedPost = selectedPost
        self.requestManager = requestManager
    }
    
    // MARK: functions
    func ready() {
        Task {
            await getComments()
        }
    }
}

extension CommentListViewModel {
    // MARK: api calls
    fileprivate func getComments() async {
        let params = ["postId":"\(selectedPost.id)"]
        let request = GetCommentsRequest(parameters: params)
        let result: RequestResult<[Comment]> = await requestManager.perform(request)
        switch result {
        case .success(let comments):
            self.comments = comments
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
