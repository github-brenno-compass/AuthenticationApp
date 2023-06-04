//
//  DeleteAuthorizationTokenUseCase.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol DeleteAuthorizationTokenUseCaseProtocol {

    func callAsFunction() throws
}

public struct DeleteAuthorizationTokenUseCase {

    @Injected(\.authorizationTokenRepository) var repository

    public init() {}
}

extension DeleteAuthorizationTokenUseCase: DeleteAuthorizationTokenUseCaseProtocol {

    public func callAsFunction() throws {
        try repository.deleteToken()
    }
}

extension Container {

    public var deleteAuthorizationTokenUseCase: Factory<DeleteAuthorizationTokenUseCaseProtocol> {
        self { DeleteAuthorizationTokenUseCase() }
    }
}
