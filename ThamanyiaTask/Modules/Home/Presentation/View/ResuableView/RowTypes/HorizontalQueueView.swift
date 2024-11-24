//
//  HorizontalQueueView.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 24/11/2024.
//

import Foundation
import SwiftUI

struct HorizontalQueueView: View {
    var items: [ContentData] // Array of item titles

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(items, id: \.id) { item in
                    Text(item.name ?? "")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

