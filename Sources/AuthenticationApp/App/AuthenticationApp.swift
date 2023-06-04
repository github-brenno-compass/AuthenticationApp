//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import GithubKit

public enum AuthenticationApp: MiniApp {

    public static func start() {
        Assembler.run([
            DomainAssembly(),
            AppDataAssembly(),
            NetworkingAssembly(),
            StorageAssembly()
        ])
    }
}
