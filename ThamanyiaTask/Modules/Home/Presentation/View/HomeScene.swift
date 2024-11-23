//
//  HomeScene.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import SwiftUI

struct HomeScene: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            Spacer()
            Text("HomeScreen")
            Button {
                viewModel.homeFlow?.openDetails()
            } label: {
                Text("click me")
            }
            Spacer()
        }
        .background(.white)
        .onAppear {
//            viewModel.getHomeList()
        }
    }
}
