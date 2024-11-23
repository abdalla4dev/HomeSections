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
        VStack(spacing: 0) {
            HomeHeaderView()

            // List Content
            List {
                ForEach(viewModel.homeDataSectionList, id: \.id) { section in
                    Section(header: headerView(for: section.name ?? "", type: section.contentType?.rawValue ?? "")) {
                        switch section.type {
                        case .bigSquare, .bigSquareWithDash, .square, .queue:
                            squareView(for: section.content ?? [])
                        case .TwoLinesGrid:
                            twoLinesGridView(for: section.content ?? [])
                        case .none:
                            Text("No display type defined")
                                .foregroundColor(.white)
                        }
                    }
                    .onAppear {
                        if viewModel.homeDataSectionList.last == section {
                            Task {
                                await viewModel.fetchHomeData()
                            }
                        }
                    }

                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .background(Color("#141520"))
        }
        .background(Color("#141520").edgesIgnoringSafeArea(.all)) // Sets overall background
        .modifier(ProgressLoader(isLoading: viewModel.state == HomeState.loading))
        .task {
            await viewModel.fetchHomeData()
        }
    }

    // MARK: - Custom Section Header

    @ViewBuilder
    private func headerView(for title: String, type: String) -> some View {
        VStack(alignment: .leading) {
            Text("\(title) (\(type))")
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding(.vertical, 10)
    }

    // MARK: - Section Views

    @ViewBuilder
    private func squareView(for items: [ContentData]) -> some View {
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

    @ViewBuilder
    private func twoLinesGridView(for items: [ContentData]) -> some View {
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
