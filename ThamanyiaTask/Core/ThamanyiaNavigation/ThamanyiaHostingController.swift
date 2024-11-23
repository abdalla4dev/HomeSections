//
//  ThamanyiaHostingController.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation
import SwiftUI

final class ThamanyiaHostingController<ContentView>: UIHostingController<ContentView> where ContentView: View {
    var onViewIsAppearing: (() -> Void)?
    var onViewDidDisappear: (() -> Void)?

    convenience init(
        rootView: ContentView,
        onViewIsAppearing: (() -> Void)?,
        onViewDidDisappear: (() -> Void)?
    ) {
        self.init(rootView: rootView)
        self.onViewIsAppearing = onViewIsAppearing
        self.onViewDidDisappear = onViewDidDisappear
    }
}
