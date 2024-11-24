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
    @Published var isloading = false
    @Published var errorMessage = ""

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
    func fetchHomeData(showLoader: Bool = false) async {
        guard !reachedEnd else { return } // prevent further requests if no more pages
        if showLoader { isloading = true }
        pageNumber += 1

        do {
            let homeData = try await homeUseCase.fetchHome(at: pageNumber).mapToPresentation()
            homeDataSectionList.append(contentsOf: homeData.sections ?? [])

            // Handle pagination
            if let totalPages = homeData.pagination?.totalPages, pageNumber >= totalPages {
                reachedEnd = true
            }
            isloading = false
        } catch let error as NetworkError {
            isloading = false
            errorMessage = error.errorDescription ?? ""
        } catch {
            isloading = false
            errorMessage = "unknown error"
        }
    }
}
