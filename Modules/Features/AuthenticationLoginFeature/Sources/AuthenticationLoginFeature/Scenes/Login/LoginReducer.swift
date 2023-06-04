//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import Factory
import AuthenticationDomain
import NavigationKit
import ComposableArchitecture

struct LoginReducer: ReducerProtocol {

    struct State: Hashable {

        var viewState: ViewState = .inactive
        var isLoading: Bool = false

        let transaction = SceneTransaction<LoginDestination>()

        init(_ scene: LoginScene) {}
    }

    enum Action {
        case viewState(ViewState)
        case loading(Bool)

        case login(String)

        case error(Error)
        case skip
        case signup
    }

    enum CancelID {
        case login
    }

    @Injected(\.generateAuthorizationTokenUseCase) var generateAuthorizationTokenUseCase

    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .viewState(let viewState):
                state.viewState = viewState
            case .loading(let isLoading):
                state.isLoading = isLoading
            case .login(let code):
                return authenticateUser(code: code)
            case .error(let error):
                state.transaction(.error(error))
            case .skip:
                state.transaction(.home)
            case .signup:
                state.transaction(.signup)
            }

            return .none
        }
    }
}

extension LoginReducer.State {

    var loginURL: URL? {
        guard let url = URL(string: "https://github.com/login/oauth/authorize") else {
            return nil
        }

        let constants = Container.shared.globalConstants()

        return url.appendingPathComponent("?scope=user&client_id=\(constants.clientAPIToken)")
    }
}

extension LoginReducer {

    func authenticateUser(code: String) -> EffectTask<Action> {
        .run { send in
            await send(.loading(true))

            do {
                try await generateAuthorizationTokenUseCase(code)
                await send(.skip)
            } catch {
                await send(.error(error))
            }

            await send(.loading(false))
        }.cancellable(id: CancelID.login)
    }
}
