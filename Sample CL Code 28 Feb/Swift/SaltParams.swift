//
//  SaltParams.swift
//  
//
//  Created by ShashiTiwari on 31/01/23.
//

import Foundation
let SALT_DELIMETER = "|"

public class SaltParams {
    var txnId: [String]
    var txnAmount: String
    var deviceId: String
    var payerLiteAccNumber: String? //This is for lite feature only
    var txnTimestamp: String? //This is for lite feature only
    var accountRef: String? //This is for lite feature only
    var appId: String
    var mobileNumber: String
    var credType: [String] //Any?
    var payerAddr: String
    var payeeAddr: String
    var random: String
    
    init(txnId: [String], txnAmount: String, deviceId: String, payerLiteAccNumber: String? = nil, txnTimestamp: String? = nil, accountRef: String? = nil, appId: String, mobileNumber: String, credType: [String], payerAddr: String, payeeAddr: String, random: String) {
        self.txnId = txnId
        self.txnAmount = txnAmount
        self.deviceId = deviceId
        self.payerLiteAccNumber = payerLiteAccNumber
        self.txnTimestamp = txnTimestamp
        self.accountRef = accountRef
        self.appId = appId
        self.mobileNumber = mobileNumber
        self.credType = credType
        self.payerAddr = payerAddr
        self.payeeAddr = payeeAddr
        self.random = random
    }
    
    func toReqBalEnq() -> SaltParams {
        self.payeeAddr = self.payerAddr
        self.txnAmount = "0.00"
        
        return self
    }
    
    func toReqBalChk(payeeAddress: String) -> SaltParams {
        self.payeeAddr = self.payerAddr
        self.txnAmount = "0.00"
        
        return self
    }
    
    func toUpiLiteOnboard(payeeAddress: String) -> SaltParams {
        self.payeeAddr = self.payerAddr
        self.txnAmount = "0.00"
        
        return self
    }
    
    public func generateSalt() -> String {
        var salt: String
//        salt = (credType as? String ?? "") + SALT_DELIMETER
        salt = credType.joined() + SALT_DELIMETER
        if txnId.count != 0 {
            salt += txnId.joined(separator: "") + SALT_DELIMETER
        }
        
        if appId != "" {
            salt += appId + SALT_DELIMETER
        }
        if mobileNumber != "" {
            salt += mobileNumber + SALT_DELIMETER
        }
        
        if deviceId != "" {
            salt += deviceId + SALT_DELIMETER
        }
        if payerAddr != "" {
            salt += payerAddr + SALT_DELIMETER
        }
        if payeeAddr != "" {
            salt += payeeAddr + SALT_DELIMETER
        }
        if txnAmount != "" {
            salt += txnAmount + SALT_DELIMETER
        }
        if salt.last! == "|"{
            salt.removeLast()
        }
        return salt
    }
}
