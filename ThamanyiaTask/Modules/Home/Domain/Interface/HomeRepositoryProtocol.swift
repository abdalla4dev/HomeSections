//
//  HomeRepositoryProtocol.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//


protocol HomeRepositoryProtocol {
    func fetchHome(at page: Int) async throws -> HomeModel
}
