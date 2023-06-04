//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import AuthenticationAppData
import RequestDL
import Factory
import GithubKit

public struct AuthorizationTokenRemoteDataSource: AuthenticationAppData.AuthorizationTokenRemoteDataSource {

    @Injected(\.globalConstants) var constants

    public init() {}

    public func generateToken(_ code: String) async throws -> String {
        try await DataTask {
            GithubAPI(.post)

            BaseURL("github.com")
            Path("login/oauth/access_token")

            Payload(OAuthRequest(
                clientID: constants.clientAPIToken,
                clientSecret: constants.clientSecret,
                code: code
            ))
        }
        .decode(OAuthResponse.self)
        .map(\.payload.accessToken)
        .result()
    }
}
