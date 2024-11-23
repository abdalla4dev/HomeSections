//
//  HomeHeaderView.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation
import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Home")
                    .foregroundColor(.white)
                    .font(.headline)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color("#272937"))
        }
    }
}
