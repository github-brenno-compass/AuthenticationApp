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

    @State var isPresenting: Bool = false
    @State var action: ErrorAction?

    func body(content: Content) -> some View {
        content
            .alert(
                "Error",
                isPresented: $isPresenting,
                presenting: action?.error,
                actions: { _ in
                    Button("Ok") {}
                },
                message: {
                    Text($0.error.localizedDescription)
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
