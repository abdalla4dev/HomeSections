//
//  NavigationContext.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation
import SwiftUI

public protocol NavigationContext {
    func setIntialView<T: View>(view: T)

    func pop(animated: Bool)
}
