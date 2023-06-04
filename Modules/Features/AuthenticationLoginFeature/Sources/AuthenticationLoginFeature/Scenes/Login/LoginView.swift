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
            VStack {
                HStack {
                    Spacer()
                    Button("Pular") {
                        viewStore.send(.skip)
                    }
                }

                Spacer()
            }
            .background {
                Image("globe", bundle: .module)
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
            }

            GithubFooter {
                GithubButton("Entrar") {
                    login()
                }

                GithubButton("Cadastrar") {
                    viewStore.send(.signup)
                }
            }
        }
        .onOpenURL {
            print($0)
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
}
