//
//  AuthorizationTokenRepositoryProtocol.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol AuthorizationTokenRepositoryProtocol {

    func deleteToken() throws

    func getToken() throws -> String

    func generateToken(_ code: String) async throws
}

extension Container {

    public var authorizationTokenRepository: Factory<AuthorizationTokenRepositoryProtocol> {
        self { fatalError() }
    }
}
