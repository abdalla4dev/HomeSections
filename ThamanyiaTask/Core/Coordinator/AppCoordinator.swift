//
//  AppCoordinator.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow!

    init(window: UIWindow) {
        self.window = window
        (UIApplication.shared.delegate as? AppDelegate)?.window = window
    }

    public func start() {
        // we can add logic if user signed in or not

        let viewModel = HomeViewModel()
        let homeScene = HomeCoordinator(
            window: window,
            viewModel: viewModel
        )
        homeScene.start()
    }
}
