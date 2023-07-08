//
//  PostListView.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 8/07/23.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var viewModel: PostListViewModel
    @EnvironmentObject var localizationManager: LocalizationManager
    
    var body: some View {
        List(viewModel.posts) { post in
            LazyVStack(alignment: .leading, spacing: 10.0) {
                Text(post.title ?? "")
                    .font(.headline)
                Text(post.body ?? "")
                    .font(.footnote)
            }
            .onNavigation {
                viewModel.onPostSelection(post)
            }
        }
        .navigationTitle(localizationManager.postListViewTitle)
        
        .onAppear {
            viewModel.ready()
        }
    }
}


struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = HomeCoordinator(requestManager: RequestManager())
        PostListView(viewModel: coordinator.postListViewModel)
            .environmentObject(LocalizationManager())
    }
}

