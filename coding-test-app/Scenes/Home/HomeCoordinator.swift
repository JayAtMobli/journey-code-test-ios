//
//  HomeCoordinator.swift
//  coding-test-app
//
//  Created by Jay Park on 8/07/23.
//

import SwiftUI

enum Page: Hashable {
    case postList
    case commentList(post: Post)
    
    var id:Int {
        self.hashValue
    }
}

@MainActor
class HomeCoordinator: ObservableObject {
    // MARK: - Properties
    private var service: ServiceProtocol
    @Published var path = NavigationPath()
    
    // MARK: - Initialiser
    init(service: ServiceProtocol) {
        self.service = service
    }
}

extension HomeCoordinator {
    // MARK: - Functions
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .postList:
            let viewModel = PostListViewModel(service: service)
            PostListView(viewModel: viewModel)
        case .commentList(let post):
            let viewModel = CommentListViewModel(selectedPost: post, service: service)
            CommentListView(viewModel: viewModel)
        }
    }
}

/* MARK: - Future possible functions
extension HomeCoordinator {
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func backToRoot() {
        path.removeLast(path.count)
    }
}
*/
