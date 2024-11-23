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

    @Published var homeData: HomeData?
    @Published var state: HomeState = .idle

    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
}

// MARK: Network

extension HomeViewModel {
    @MainActor
    func fetchHomeData(at page: Int) async {
        state = .loading
        do {
            homeData = try await homeUseCase.fetchHome(at: page).mapToPresentation()
            state = .loaded
        } catch let error as NetworkError {
            state = .failed(error.errorDescription ?? "Unexpected error")
        } catch {
            state = .failed("Unexpected error: \(error.localizedDescription)")
        }
        state = .loaded
    }
}
