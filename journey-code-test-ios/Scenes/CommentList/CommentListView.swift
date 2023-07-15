//
//  CommentListView.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 8/07/23.
//

import SwiftUI

struct CommentListView: View {
    @ObservedObject var viewModel: CommentListViewModel
    @EnvironmentObject var localizationManager: LocalizationManager
    
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
        let viewModel = CommentListViewModel(selectedPost: post, service: NetworkService(requestManager: RequestManager()))
        CommentListView(viewModel: viewModel)
            .environmentObject(LocalizationManager())
    }
}


