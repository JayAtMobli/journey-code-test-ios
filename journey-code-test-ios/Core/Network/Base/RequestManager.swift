//
//  RequestManager.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

typealias RequestResult<T> = Result<T, Error>

final class RequestManager {
    let apiManager: ApiManagerProtocol
    let parser: DataParserProtocol

    init(
        apiManager: ApiManagerProtocol = ApiManager(),
        parser: DataParserProtocol = DataParser()
    ) {
        self.apiManager = apiManager
        self.parser = parser
    }

    func perform<T: Decodable>(_ request: RequestProtocol) async -> RequestResult<T> {
        do {
            /* MARK: - This is where I check authToken expiry and refresh it from the responsible layer
            if request.addAuthorizationToken && !accessTokenManager.isTokenValid() {
                await accessTokenManager.refreshToken()
            }
            */
            /* MARK: - and then inject token
             *
            let urlRequest = request.addAuthorizationToken ? try request.createURLRequest(authToken: accessTokenManager.token() : try request.createURLRequest()
            */
            
            let urlRequest = try request.createURLRequest()
            
            let result = await apiManager.perform(urlRequest) as Result<Data, Error>
            switch result {
            case .success(let data):
                let value: T = try parser.decode(data)
                return .success(value)
            case .failure(let error):
                return .failure(error)
            }

        } catch let error {
            return .failure(error)
        }
    }
}
