//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import AuthenticationScenes
import NavigationKit

public struct AlertsFeatureResolver: FeatureResolver {

    private let scene: AlertsFeatureScene

    public init(_ scene: AlertsFeatureScene) {
        self.scene = scene
    }

    public var body: some View {
        switch scene {
        default:
            EmptyView()
        }
    }
}
