//
//  SectionHeaderView.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation
import SwiftUI

struct SectionHeaderView: View {
    var title: String
    var type: String

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text("\(title) (\(type))")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 10)
        }
    }
}
