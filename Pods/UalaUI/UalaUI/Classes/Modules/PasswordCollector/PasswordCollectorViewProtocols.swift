//
//  PasswordCollectorViewProtocols.swift
//  UalaUI
//
//  Created by Agustina Ardisana on 31/10/2022.
//

public protocol PasswordCollectorViewType: UIViewController {
    @MainActor
    func setError(_ value: Bool) async
}

public extension PasswordCollectorViewType {
    @MainActor
    func setError(_ value: Bool) async {
        // empty default implementation
    }
}
