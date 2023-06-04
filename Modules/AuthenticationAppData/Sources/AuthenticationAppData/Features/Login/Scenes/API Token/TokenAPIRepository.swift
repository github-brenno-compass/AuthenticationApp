//
//  APITokenRepository.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import AuthenticationDomain
import Factory

public struct APITokenRepository {

    @Injected(\.apiTokenLocalDataSource) var local
    @Injected(\.apiTokenRemoteDataSource) var remote

    public init() {}
}

extension APITokenRepository: APITokenRepositoryProtocol {

    public func getToken() throws -> String {
        try local.getToken()
    }
}
