//
//  CommentListView.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 8/07/23.
//

import SwiftUI

struct CommentListView: View {
    @ObservedObject var viewModel: CommentListViewModel
    
    var body: some View {
        List(viewModel.comments) { comment in
            LazyVStack(alignment: .leading, spacing: 10.0) {
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
        .navigationTitle("Comments")
        
        .onAppear {
            viewModel.ready()
        }
    }
}


struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post(userId: 1, id: 1)
        let viewModel = CommentListViewModel(selectedPost: post, requestManager: RequestManager())
        CommentListView(viewModel: viewModel)
    }
}

