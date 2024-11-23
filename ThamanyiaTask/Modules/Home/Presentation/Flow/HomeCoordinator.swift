//
//  HomeCoordinator.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation
import UIKit

protocol Homeflow {
    func openDetails()
}

class HomeCoordinator: Coordinator, ObservableObject {
    var window: UIWindow!
    var viewModel: HomeViewModel!
    var navigationController: ThamanyiaNavigationController!

    init(window: UIWindow, viewModel: HomeViewModel) {
        self.window = window
        (UIApplication.shared.delegate as? AppDelegate)?.window = window
        self.viewModel = viewModel
    }

    func start() {
        navigationController = ThamanyiaNavigationController()
        let viewModel = HomeViewModel()
        viewModel.homeFlow = self
        navigationController.setIntialView(
            view: HomeScene(viewModel: viewModel))
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension HomeCoordinator: Homeflow {
    func openDetails() {
        print("openDetails")
    }
}
