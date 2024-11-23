//
//  ProgressLoader.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import SwiftUI

struct ProgressLoader: AnimatableModifier {
    var isLoading: Bool

    init(isLoading: Bool, color _: Color = .primary, lineWidth _: CGFloat = 3) {
        self.isLoading = isLoading
    }

    var animatableData: Bool {
        get { isLoading }
        set { isLoading = newValue }
    }

    func body(content: Content) -> some View {
        if isLoading {
            content
                .disabled(true)
                .overlay {
                    ZStack(alignment: .center) {
                        LottieView(lottieFile: "loader")
                            .frame(width: 120, height: 120)
                        Spacer()
                    }
                }
        } else {
            content
        }
    }
}
