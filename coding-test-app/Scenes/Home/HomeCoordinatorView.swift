//
//  HomeCoordinatorView.swift
//  coding-test-app
//
//  Created by Jay Park on 8/07/23.
//

import SwiftUI

struct HomeCoordinatorView: View {
    @StateObject var coordinator = HomeCoordinator(service: NetworkService(requestManager: RequestManager()))
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .postList)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
    }
}


struct HomeCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = HomeCoordinator(service: NetworkService(requestManager: RequestManager()))
        HomeCoordinatorView(coordinator: coordinator)
            .environmentObject(LocalizationManager())
    }
}
