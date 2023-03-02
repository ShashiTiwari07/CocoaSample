//
//  File.swift
//  
//
//  Created by orange on 31/01/23.
//

import Foundation

//TODO: Write Errors here

enum UpiServiceCallback {
    case success(String)
    case failure(UpiServiceStatus)
}

public enum UpiServiceStatus {
    case networkError(code: Int)
    case anotherError(message: String?)
    case underlying(Swift.Error)

    public var description: String {
        switch self {
            case .networkError(let code):
                return "Network error with code \(code)"
            default://I'm not gonna cover all cases, but you should :)
                return "Error"
        }
    }
}
