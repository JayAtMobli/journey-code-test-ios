//
//  DataParser.swift
//  coding-test-app
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

// MARK: - JSon data encoding/decoding layer

protocol DataParserProtocol {
    func decode<T: Decodable>(_ data: Data) throws ->  T
    func encode<T: Encodable>(_ object: T) throws -> Data
}

class DataParser: DataParserProtocol {
    private var decoder: JSONDecoder
    private var encoder: JSONEncoder

    init(decoder: JSONDecoder = JSONDecoder(),
         encoder: JSONEncoder = JSONEncoder()) {
        self.decoder = decoder
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.decoder.dateDecodingStrategy = .iso8601
        
        self.encoder = encoder
    }

    func decode<T: Decodable>(_ data: Data) throws ->  T {
        return try decoder.decode(T.self, from: data)
    }

    func encode<T: Encodable>(_ object: T) throws -> Data {
        return try encoder.encode(object)
    }
}
