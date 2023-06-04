//
//  UpdateAuthorizationTokenUseCase.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol RefreshAuthorizationTokenUseCaseProtocol {

    func callAsFunction() async throws
}

public struct RefreshAuthorizationTokenUseCase {

    @Injected(\.authorizationTokenRepository) var repository

    public init() {}
}

extension RefreshAuthorizationTokenUseCase: RefreshAuthorizationTokenUseCaseProtocol {

    public func callAsFunction() async throws {
        try await repository.refreshToken()
    }
}

extension Container {

    public var refreshAuthorizationTokenUseCase: Factory<RefreshAuthorizationTokenUseCaseProtocol> {
        self { RefreshAuthorizationTokenUseCase() }
    }
}
