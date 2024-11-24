//
//  SquareView.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation
import SwiftUI

struct SquareView: View {
    var items: [ContentData]
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) { // Enable horizontal scrolling
                LazyHStack {
                    ForEach(items, id: \.id) { item in
                        VStack(alignment: .leading) {
                            if let avatarURL = item.avatarURL {
                                AsyncImage(url: URL(string: avatarURL)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            Text("\(item.name ?? "") episodes")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        .frame(width: 120)
                    }
                }
            }
        }
    }
}
