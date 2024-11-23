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

    var homeData: HomeData?
    var errorMessage: String?

    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
}

// MARK: Network

extension HomeViewModel {
    func fetchHomeData(at page: Int) async {
//        isLoading = true
        do {
            homeData = try await homeUseCase.fetchHome(at: page).mapToPresentation()
            errorMessage = nil
        } catch let error as NetworkError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = "Unexpected error: \(error.localizedDescription)"
        }
//        isLoading = false
    }
}
