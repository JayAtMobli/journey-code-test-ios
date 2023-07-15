//
//  HomeCoordinatorView.swift
//  coding-test-app
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
        .navigationViewStyle(.stack)
    }
    
    // MARK: - view builders for child views
    @ViewBuilder
    private func commentListView(viewModel: CommentListViewModel) -> some View {
        CommentListView(viewModel: viewModel)
    }
}


struct HomeCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = HomeCoordinator(service: NetworkService(requestManager: RequestManager()))
        HomeCoordinatorView(coordinator: coordinator)
            .environmentObject(LocalizationManager())
    }
}

