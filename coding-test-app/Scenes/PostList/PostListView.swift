//
//  PostListView.swift
//  coding-test-app
//
//  Created by Jay Park on 8/07/23.
//

import SwiftUI

struct PostListView: View {
    @StateObject private var viewModel: PostListViewModel
    @EnvironmentObject var localizationManager: LocalizationManager
    
    init(service: ServiceProtocol) {
        _viewModel = .init(wrappedValue: {PostListViewModel(service: service)}())
    }
    
    var body: some View {
        List(viewModel.filteredPosts) { post in
            NavigationLink(value: Page.commentList(post: post)) {
                PostListCell(post: post)
            }
        }
        .navigationTitle(localizationManager.postListViewTitle)
        .searchable(text: $viewModel.searchTerms)
        .refreshable {
            viewModel.refresh()
        }
        .onAppear {
            viewModel.ready()
        }
    }
}

struct PostListCell: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(post.title ?? "")
                .font(.headline)
            Text(post.body ?? "")
                .font(.footnote)
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(service: MockedService())
            .environmentObject(LocalizationManager())
    }
}
