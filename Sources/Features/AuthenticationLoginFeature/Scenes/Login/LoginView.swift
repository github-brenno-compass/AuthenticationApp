//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import ComposableArchitecture
import GithubUI

struct LoginView: View {

    @Environment(\.openURL) var openURL

    let viewStore: ViewStoreOf<LoginReducer>

    var body: some View {
        GithubScreen {
            VStack(spacing: .zero) {
                Rectangle()
                    .fill(.regularMaterial)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 1)

                titleStylized
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                    .padding([.top, .horizontal], 16)
                    .environment(\.colorScheme, .light)
            }
            .background {
                Image("globe", bundle: .module)
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .scaledToFill()
            }

            GithubFooter {
                GithubButton(L10n.LoginView.login) {
                    login()
                }

                GithubButton(L10n.LoginView.signup) {
                    viewStore.send(.signup)
                }
            }
        }
        .onOpenURL(perform: authenticate)
        .viewState(viewStore.binding(
            get: \.viewState,
            send: { .viewState($0) }
        ))
        .disabled(viewStore.isLoading)
        .overlay {
            if viewStore.isLoading {
                ProgressView()
                    .frame(width: 64, height: 64)
                    .background {
                        Rectangle()
                            .fill(.thickMaterial)
                    }
                    .cornerRadius(8)
                    .shadow(radius: 8)
            }
        }
    }
}

extension LoginView {

    var title: some View {
        Text("Olá,\nbem-vindo!")
            .font(.system(size: 64))
            .multilineTextAlignment(.center)
    }

    var titleStylized: some View {
        title
            .overlay(
                Rectangle()
                    .fill(.thickMaterial)
            )
            .mask {
                title
            }
    }
}

extension LoginView {

    func login() {
        guard let url = viewStore.loginURL else {
            return
        }

        openURL(url)
    }

    func authenticate(_ url: URL) {
        guard
            let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
            components.scheme == "uol.compass.github",
            components.host == "authorized",
            let code = components.queryItems?.first(where: { $0.name == "code" })?.value
        else { return  }

        viewStore.send(.login(code))
    }
}
