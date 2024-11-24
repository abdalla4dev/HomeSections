//
//  HomeViewModelTest.swift
//  ThamanyiaTaskTests
//
//  Created by abdallah ragab on 24/11/2024.
//

import Testing
@testable import ThamanyiaTask

struct HomeViewModelTests {
    @Test
    func testFetchHomeDataSuccess() async throws {
        // Arrange
        let mockSections = [
            SectionModel(name: "Section 1", type: "square", contentType: "podcast", order: 1, content: []),
            SectionModel(name: "Section 2", type: "queue", contentType: "episode", order: 2, content: []),
        ]
        let mockPagination = PaginationModel(nextPage: "/page/2", totalPages: 2)
        let mockData = HomeModel(sections: mockSections, pagination: mockPagination)
        let mockUseCase = MockHomeUseCase(mockData: mockData)
        let viewModel = HomeViewModel(homeUseCase: mockUseCase)

        // Act
        await viewModel.fetchHomeData()

        // Assert
        assert(viewModel.homeDataSectionList.count == 2)
        assert(viewModel.homeDataSectionList[0].name == "Section 1")
        assert(viewModel.reachedEnd == false)
        assert(viewModel.pageNumber == 1)
    }

    @Test
    func testFetchHomeDataEmptySections() async throws {
        // Arrange
        let mockData = HomeModel(sections: [], pagination: PaginationModel(nextPage: nil, totalPages: 1))
        let mockUseCase = MockHomeUseCase(mockData: mockData)
        let viewModel = HomeViewModel(homeUseCase: mockUseCase)

        // Act
        await viewModel.fetchHomeData()

        // Assert
        assert(viewModel.homeDataSectionList.isEmpty == true)
        assert(viewModel.reachedEnd == true)
        assert(viewModel.pageNumber == 1)
    }

    @Test
    func testFetchHomeDataFailure() async throws {
        // Arrange
        let mockUseCase = MockHomeUseCase(shouldThrowError: true)
        let viewModel = HomeViewModel(homeUseCase: mockUseCase)

        // Act
        await viewModel.fetchHomeData()

        // Assert
        assert(viewModel.homeDataSectionList.isEmpty == true)
        assert(viewModel.reachedEnd == false)
        assert(viewModel.isloading == false)
    }

    @Test
    func testLoaderState() async throws {
        // Arrange
        let mockData = HomeModel(sections: [], pagination: PaginationModel(nextPage: nil, totalPages: 1))
        let mockUseCase = MockHomeUseCase(mockData: mockData)
        let viewModel = HomeViewModel(homeUseCase: mockUseCase)

        // Act
        await viewModel.fetchHomeData(showLoader: true)

        // Assert
        assert(viewModel.isloading == false)
    }
}
