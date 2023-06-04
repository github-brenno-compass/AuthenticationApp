//
//  NavigationBuilder.swift
//  Sample
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import NavigationKit
import GithubKit
import GithubUI
import AuthenticationApp

struct NavigationBuilder: GithubKit.NavigationBuilder {

    func callAsFunction<Content>(content: @escaping () -> Content) -> AnyView where Content : View {
        AnyView(
            NKNavigationStack {
                content()
                    .modifier(AuthenticationAppActions())
                    .modifier(AuthenticationAppDescriptor())
            }
        )
    }
}
