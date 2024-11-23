//
//  fdsfd.swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation

enum HomeState: Equatable {
    case idle
    case loading
    case failed(String)
    case loaded

    static func == (lhs: HomeState, rhs: HomeState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        case (.failed, .failed):
            return true
        case (.loaded, .loaded):
            return true
        default: return false
        }
    }
}
