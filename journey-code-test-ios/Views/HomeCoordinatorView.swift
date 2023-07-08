//
//  HomeCoordinatorView.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 8/07/23.
//

import SwiftUI

struct HomeCoordinatorView: View {
    @ObservedObject var coordinator: HomeCoordinator
    
    var body: some View {
        NavigationView {
            PostListView(viewModel: coordinator.postListViewModel)
                .navigation(item: $coordinator.commentListViewModel) { viewModel in
                    commentListView(viewModel: viewModel)
                }
        }
    }
    
    @ViewBuilder
    private func commentListView(viewModel: CommentListViewModel) -> some View {
        CommentListView(viewModel: viewModel)
    }
}


struct HomeCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = HomeCoordinator(requestManager: RequestManager())
        HomeCoordinatorView(coordinator: coordinator)
            .environmentObject(LocalizationManager())
    }
}

