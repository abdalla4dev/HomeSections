//
//  MockHomeUseCase.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 24/11/2024.
//

import Foundation
@testable import ThamanyiaTask

class MockHomeUseCase: HomeUseCase {
    var mockData: HomeModel?
    var shouldThrowError: Bool = false

    init(mockData: HomeModel? = nil, shouldThrowError: Bool = false) {
        self.mockData = mockData
        self.shouldThrowError = shouldThrowError
    }

    func fetchHome(at _: Int) async throws -> HomeModel {
        if shouldThrowError {
            throw NetworkError.invalidResponse
        }
        return mockData ?? HomeModel(sections: [], pagination: nil)
    }
}
