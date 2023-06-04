//
//  AuthorizationTokenRepository.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import AuthenticationDomain
import Factory

public struct AuthorizationTokenRepository {

    @Injected(\.authorizationTokenLocalDataSource) var local
    @Injected(\.authorizationTokenRemoteDataSource) var remote

    public init() {}
}

extension AuthorizationTokenRepository: AuthorizationTokenRepositoryProtocol {

    public func deleteToken() throws {
        try local.deleteToken()
    }

    public func getToken() throws -> String {
        try local.getToken()
    }

    public func updateToken(_ token: String) throws {
        try local.updateToken(token)
    }

    public func refreshToken() async throws {
        let token = try await remote.refreshToken()
        try local.updateToken(token)
    }
}
