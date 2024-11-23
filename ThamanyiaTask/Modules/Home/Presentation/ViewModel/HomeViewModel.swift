//
//  HomeViewModel.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    var homeFlow: Homeflow?
    private let homeUseCase: HomeUseCase

    @Published var homeDataSectionList: [SectionData] = []
    @Published var state: HomeState = .idle

    // pagination
    var pageNumber = 0
    var reachedEnd: Bool = false

    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
}

// MARK: Network

extension HomeViewModel {
    @MainActor
    func fetchHomeData() async {
        guard !reachedEnd else { return } // prevent further requests if no more pages
        state = .loading
        pageNumber += 1

        do {
            let homeData = try await homeUseCase.fetchHome(at: pageNumber).mapToPresentation()
            // Safely handle optional homeDataSectionList

            homeDataSectionList += homeData.sections ?? []

            // Handle pagination
            if let totalPages = homeData.pagination?.totalPages, pageNumber >= totalPages {
                reachedEnd = true
            }
            state = .loaded
        } catch let error as NetworkError {
            state = .failed(error.errorDescription ?? "Unexpected error")
        } catch {
            state = .failed("Unexpected error: \(error.localizedDescription)")
        }
    }
}
