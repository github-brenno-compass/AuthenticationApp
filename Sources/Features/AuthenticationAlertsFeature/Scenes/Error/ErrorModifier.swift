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

struct ErrorViewModifier: ViewModifier {

    @Environment(\.sceneAction) var sceneAction

    @State var isPresenting: Bool = false
    @State var action: ErrorAction?

    func body(content: Content) -> some View {
        content
            .alert(
                title,
                isPresented: $isPresenting,
                presenting: action?.error,
                actions: { error in
                    Button(L10n.ErrorViewModifier.ok) {
                        if error.error is LogoutError {
                            sceneAction(AuthenticationAppAction.logout(.init()))
                        }
                    }
                },
                message: {
                    if let localized = $0.error as? LocalizedError,
                       let description = localized.errorDescription {
                        Text(description)
                    }
                }
            )
            .sceneAction(for: ErrorAction.self) {
                action = $0
            }
            .onChange(of: isPresenting) {
                if !$0 {
                    action = nil
                }
            }
            .onChange(of: action) {
                if $0 != nil {
                    isPresenting = true
                }
            }
    }
}

extension ErrorViewModifier {

    var title: String {
        if action?.error.error is LogoutError {
            return L10n.ErrorViewModifier.Logout.title
        }

        return L10n.ErrorViewModifier.Default.title
    }
}
