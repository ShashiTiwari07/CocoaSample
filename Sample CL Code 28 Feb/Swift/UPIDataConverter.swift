//
//  UpiHelper.swift
//
//
//  Created by ShashiTiwari on 23/01/23.
//

import Foundation

class UPIDataConverter: NSObject {

    func convertToDictionaryData(structInstance: Any) -> [AnyHashable: Any] {
        let mirror = Mirror(reflecting: structInstance)
        var dictionary = [AnyHashable: Any]()
        for child in mirror.children {
            if let key = child.label {
                dictionary[key] = child.value
            }
        }
        return dictionary
    }
}
extension Encodable {
    
    public func toJSONString() -> String {
        let jsonData = try! JSONEncoder().encode(self)
        return String(data: jsonData, encoding: .utf8)!
    }
    
}
