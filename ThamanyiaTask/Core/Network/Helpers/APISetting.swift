//
//  APISetting .swift
//  ThamanyiaTask
//
//  Created by abdallah ragab on 23/11/2024.
//

import Foundation

enum EnvironmentVariables: String {
    case baseURL = "BASE_API_URL"
}

enum APISetting {
    // global variable from info.plist
    static var baseURL: String {
        getStringValueFromDict(key: .baseURL)
    }
}

func getStringValueFromDict(key: EnvironmentVariables) -> String {
    return Bundle.main.infoDictionary?[key.rawValue] as? String ?? ""
}
