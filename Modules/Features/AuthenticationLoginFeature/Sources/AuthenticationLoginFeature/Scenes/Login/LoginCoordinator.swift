//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import AuthenticationScenes
import NavigationKit
import GithubKit
import Factory
import ComposableArchitecture

struct LoginCoordinator: Coordinator {

    @Environment(\.sceneAction) var sceneAction
    @Environment(\.openURL) var openURL

    let scene: LoginScene

    var body: some View {
        ObjectConnection(scene, \.store) {
            WithViewStore($0) { viewStore in
                LoginView(viewStore: viewStore)
                    .onReceive(viewStore.transaction.publisher) {
                        switch $0 {
                        case .error(let error):
                            openError(error)
                        case .home:
                            openHome()
                        case .signup:
                            openSignup()
                        }
                    }
            }
        }
    }
}

extension LoginCoordinator {

    func openError(_ error: Error) {
        sceneAction(AuthenticationAppAction.error(
            AuthenticationAppAction.Failure(error)
        ))
    }

    func openHome() {
        sceneAction(AuthenticationAppAction.authenticated(
            AuthenticationAppAction.Authenticated()
        ))
    }

    func openSignup() {
        guard let url = URL(string: "https://www.github.com/signup") else {
            return
        }

        openURL(url)
    }
}
