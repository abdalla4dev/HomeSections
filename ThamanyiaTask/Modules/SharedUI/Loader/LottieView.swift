//
//  dsafd.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    let lottieFile: String
    var loopMode: LottieLoopMode = .loop
    var animationSpeed: Double = 2

    let animationView = LottieAnimationView()

    func makeUIView(context _: Context) -> some UIView {
        let view = UIView(frame: .zero)

        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.play()
        view.addSubview(animationView)

        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        return view
    }

    func updateUIView(_: UIViewType, context _: Context) {}
}
