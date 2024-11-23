//
//  ThamanyiaNavigationController.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation
import SwiftUI

public class ThamanyiaNavigationController: UINavigationController, NavigationContext {
    public func setIntialView<T: View>(view: T) {
        setNavigationBarHidden(true, animated: true)
        let vc = ThamanyiaHostingController(rootView: view)
        viewControllers = [vc]
    }

    public func push<T: View>(
        view: T,
        onViewIsAppearing _: (() -> Void)?,
        onViewDidDisappear _: (() -> Void)?,
        animated: Bool
    ) {
        setNavigationBarHidden(true, animated: true)
        let vc = ThamanyiaHostingController(rootView: view)
        pushViewController(vc, animated: animated)
    }

    public func pop(animated: Bool) {
        navigationController?.popViewController(animated: true)
    }
}
