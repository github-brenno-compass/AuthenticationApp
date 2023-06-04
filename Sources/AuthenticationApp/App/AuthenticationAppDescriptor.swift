//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import GithubKit
import NavigationKit
import AuthenticationAlertsFeature
import AuthenticationLoginFeature

public struct AuthenticationAppDescriptor: MiniAppDescriptor {

    public init() {}

    public func body(content: Content) -> some View {
        content
            .modifier(AlertsFeatureDescriptor())
            .modifier(LoginFeatureDescriptor())
    }
}
