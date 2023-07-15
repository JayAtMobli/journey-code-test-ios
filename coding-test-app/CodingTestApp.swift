//
//  CodingTestApp.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 7/07/23.
//

import SwiftUI

@main
struct CodingTestApp: App {
    @StateObject var coordinator = HomeCoordinator(service: NetworkService(requestManager: RequestManager()))
    @StateObject var localizationManager = LocalizationManager()
    
    var body: some Scene {
        WindowGroup {
            HomeCoordinatorView(coordinator: coordinator)
                .environmentObject(localizationManager)
        }
    }
}
