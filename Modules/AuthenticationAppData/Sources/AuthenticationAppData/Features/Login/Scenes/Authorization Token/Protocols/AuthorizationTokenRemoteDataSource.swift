//
//  AuthorizationTokenRemoteDataSource.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol AuthorizationTokenRemoteDataSource {

    func refreshToken() async throws -> String
}

extension Container {

    public var authorizationTokenRemoteDataSource: Factory<AuthorizationTokenRemoteDataSource> {
        self { fatalError() }
    }
}
