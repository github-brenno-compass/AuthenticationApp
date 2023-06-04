//
//  GetAuthorizationTokenUseCase.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory
import GithubKit

public protocol GetAuthorizationTokenUseCaseProtocol {

    func callAsFunction() throws -> String
}

public struct GetAuthorizationTokenUseCase {

    @Injected(\.authorizationTokenRepository) var repository

    public init() {}
}

extension GetAuthorizationTokenUseCase: GetAuthorizationTokenUseCaseProtocol {

    public func callAsFunction() throws -> String {
        try repository.getToken()
    }
}

extension GetAuthorizationTokenUseCase: GlobalGetAuthorizationTokenUseCaseProtocol {}

extension Container {

    public var getAuthorizationTokenUseCase: Factory<GetAuthorizationTokenUseCaseProtocol> {
        self { GetAuthorizationTokenUseCase() }
    }
}
