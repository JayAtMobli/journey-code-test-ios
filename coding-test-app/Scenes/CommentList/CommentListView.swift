//
//  CommentListView.swift
//  coding-test-app
//
//  Created by Jay Park on 8/07/23.
//

import SwiftUI

struct CommentListView: View {
    @StateObject private var viewModel: CommentListViewModel
    @EnvironmentObject var localizationManager: LocalizationManager
    
    init(selectedPost: Post, service: ServiceProtocol) {
        _viewModel = .init(wrappedValue: {CommentListViewModel(selectedPost: selectedPost, service: service)}())
    }
    
    var body: some View {
        List(viewModel.filteredComments) { comment in
            CommentListCell(comment: comment)
        }
        .navigationTitle(localizationManager.commentListViewTitle)
        .searchable(text: $viewModel.searchTerms)
        .refreshable {
            viewModel.refresh()
        }
        .onAppear {
            viewModel.ready()
        }
    }
}

struct CommentListCell: View {
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            VStack(alignment: .leading, spacing: 5.0) {
                Text(comment.name ?? "")
                    .font(.headline)
                Text(comment.email ?? "")
                    .font(.footnote)
            }
            
            Text(comment.body ?? "")
                .font(.footnote)
        }
    }
}

struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post(userId: 1, id: 1)
        CommentListView(selectedPost: post, service: MockedService())
            .environmentObject(LocalizationManager())
    }
}


