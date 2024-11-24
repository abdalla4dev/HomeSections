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
        HStack {
            // Profile Icon
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)

            // Greeting Text and Icon
            HStack {
                Text("good morning abdelrahman")
                    .foregroundColor(.white)
                    .font(.headline)
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.yellow)
            }


            Spacer()

            // Notification Icon with Badge
            ZStack(alignment: .topTrailing) {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)

                // Red Badge
                Text("4")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Circle().foregroundColor(.red))
                    .offset(x: 10, y: -10)
            }
        }
        .padding()
        .background(Color("#141520"))
    }
}
