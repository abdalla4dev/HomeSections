//
//  BigSquareView.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 24/11/2024.
//

import Foundation
import SwiftUI

struct BigSquareView: View {
    var items: [ContentData]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(items, id: \.id) { item in
                    BigSquareViewCardView(item: item)
                }
            }
        }
    }
}

// Card Component
struct BigSquareViewCardView: View {
    let item: ContentData

    var body: some View {
        HStack(spacing: 15) {
            // Image
            if let avatarURL = item.avatarURL {
                AsyncImage(url: URL(string: avatarURL)) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 150, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            // Text Content
            VStack(alignment: .leading, spacing: 8) {
                Text(item.name ?? "")
                    .font(.headline)
                    .lineLimit(2)
                    .foregroundColor(.white)

                if let description = item.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(3)
                }

                Text("5 hours ago") // Replace with actual dynamic time if available
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color("#272937"))
        .cornerRadius(15)
        .frame(width: UIScreen.main.bounds.width - 55)
    }
}
