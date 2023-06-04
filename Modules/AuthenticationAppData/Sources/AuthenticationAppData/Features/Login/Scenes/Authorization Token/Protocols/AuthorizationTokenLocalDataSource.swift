//
//  AuthorizationTokenLocalDataSource.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol AuthorizationTokenLocalDataSource {

    func deleteToken() throws

    func getToken() throws -> String

    func updateToken(_ token: String) throws
}

extension Container {

    public var authorizationTokenLocalDataSource: Factory<AuthorizationTokenLocalDataSource> {
        self { fatalError() }
    }
}
