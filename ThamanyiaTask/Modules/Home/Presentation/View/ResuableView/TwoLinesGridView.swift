//
//  TwoLinesGridView.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation
import SwiftUI

struct TwoLinesGridView: View {
    var items: [ContentData]
    var body: some View {
        VStack(spacing: 0) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(items, id: \.id) { item in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("#129582"))
                        .frame(height: 100)
                        .overlay(
                            Text(item.name ?? "")
                                .foregroundColor(.white)
                                .bold()
                                .padding()
                        )
                }
            }
            .padding(.vertical, 10)
        }
    }
}
