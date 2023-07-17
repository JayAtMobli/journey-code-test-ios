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
            PostListView(service: service)
        case .commentList(let post):
            CommentListView(selectedPost: post, service: service)
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
