//
//  HomeUseCase.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

protocol HomeUseCase {
    func fetchHome(at page: Int) async throws -> HomeModel
}

class DefaultHomeUseCase: HomeUseCase {
    private let homeRepository: HomeRepository

    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
    }

    func fetchHome(at page: Int) async throws -> HomeModel {
        return try await homeRepository.fetchHome(at: page)
    }
}
