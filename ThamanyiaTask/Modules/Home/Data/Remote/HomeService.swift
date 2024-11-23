//
//  HomeService.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

protocol HomeServiceProtocol {
    func fetchHome(at page: Int) async throws -> HomeDTO
}

final class HomeService: HomeServiceProtocol {
    private let networkManager: NetworkSendableProtocol = NetworkManager.shared

    func fetchHome(at page: Int) async throws -> HomeDTO {
        let endpoint = HomeEndpoint.getHome(page: page)
        do {
            // Perform the network request using async/await
            let homeData: HomeDTO = try await networkManager.send(
                model: HomeDTO.self,
                endpoint: endpoint
            )
            return homeData
        } catch {
            throw error
        }
    }
}
