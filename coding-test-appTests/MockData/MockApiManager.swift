//
//  MockApiManager.swift
//  coding-test-appTests
//
//  Created by Jay Park on 7/07/23.
//

import Foundation
@testable import coding_test_app

struct MockApiManager: ApiManagerProtocol {
    func perform(_ request: URLRequest) async -> Result<Data, Error> {
        guard let path = request.url?.path,
            let data =  try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            return .failure(NetworkError.invalidServerResponse)
        }
        return .success(data)
    }
}
