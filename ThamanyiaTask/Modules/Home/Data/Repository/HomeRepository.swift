//
//  HomeRepository.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation

final class HomeRepository: HomeRepositoryProtocol {
    var homeService: HomeServiceProtocol

    init(homeService: HomeServiceProtocol) {
        self.homeService = homeService
    }

    func fetchHome(at page: Int) async throws -> HomeModel {
        do {
            let homeDTO = try await homeService.fetchHome(at: page)
            return homeDTO.mapToDomain()
        } catch {
            let networkError = error as? NetworkError ?? .connectionFailed
            throw networkError
        }
    }
}
