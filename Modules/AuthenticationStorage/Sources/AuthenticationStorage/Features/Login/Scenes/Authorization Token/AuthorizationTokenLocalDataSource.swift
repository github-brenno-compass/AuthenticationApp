//
//  AuthorizationTokenLocalDataSource.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import AuthenticationAppData
import SimpleKeychain

public struct AuthorizationTokenLocalDataSource: AuthenticationAppData.AuthorizationTokenLocalDataSource {

    private let key = String(describing: Self.self)

    public init() {}

    public func deleteToken() throws {
        try SimpleKeychain.main.deleteItem(forKey: key)
    }

    public func getToken() throws -> String {
        try SimpleKeychain.main.string(forKey: key)
    }

    public func updateToken(_ token: String) throws {
        try SimpleKeychain.main.set(token, forKey: key)
    }
}

