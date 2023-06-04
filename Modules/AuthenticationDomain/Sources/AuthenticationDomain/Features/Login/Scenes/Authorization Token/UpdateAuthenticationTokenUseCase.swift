//
//  UpdateAuthorizationTokenUseCase.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol UpdateAuthorizationTokenUseCaseProtocol {

    func callAsFunction(_ token: String) throws
}

public struct UpdateAuthorizationTokenUseCase {

    @Injected(\.authorizationTokenRepository) var repository

    public init() {}
}

extension UpdateAuthorizationTokenUseCase: UpdateAuthorizationTokenUseCaseProtocol {

    public func callAsFunction(_ token: String) throws {
        try repository.updateToken(token)
    }
}

extension Container {

    public var updateAuthorizationTokenUseCase: Factory<UpdateAuthorizationTokenUseCaseProtocol> {
        self { UpdateAuthorizationTokenUseCase() }
    }
}
