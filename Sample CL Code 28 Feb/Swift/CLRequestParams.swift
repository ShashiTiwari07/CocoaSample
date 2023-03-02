//
//  CLRequestParams.swift
//  
//
//  Created by ShashiTiwari on 31/01/23.
//

import Foundation

public struct CLRequestParams {
    var credType: [String]
    var flowType: String
    var atmPinLength: String?
    var otpLength: String?
    var mPinLength: String?
    var aadharLength: String?
    var txnID: [String]?
    var refId: String?
    var txnAmt: String?
    var deviceId: String
    var payerLiteAccNumber: String? //This is for lite feature only // Not added
    var txnTimestamp: String? //This is for lite feature only // Not added
    var accountNo: String?
    var appId: String
    var mobileNo: String
    var payeeName: String?
    var payerAddress: String?
    var payeeAddress: String?
    var referenceWebUrl: String?
    var mandateSubType: String?
    var languagePref: String?
    var token: String?
    var listKeysXmlPayload: String? // we will receive it from list of keys with payloa
    var note: String? //configuration params
    var npciBankColorCode: String?
    var payerBankName: String
    var imageUrl: String?
    var resendAadhaarOTPFeature: String //New feature
    var resendIssuerOTPFeature: String //New feature
    var issuerResendOTPLimit: Int //New feature
    var aadhaarResendOTPLimit: Int //New feature
    var verifiedMerchant: String  //New feature
    var forgotUpiPINEnabled: String
    var captureCardDetails: String  //New feature
    var isAuthOffline: String  //New feature
    var enableUserAuth: String
    var getDeviceDetails: String //New feature
    
    enum CodingKeys: String, CodingKey {
        
        
        case credType = "credType"
        case flowType = "flowType"
        case atmPinLength = "atmPinLength"
        case otpLength = "otpLength"
        case mPinLength = "mPinLength"
        case aadharLength = "aadharLength"
        case txnID = "txnID"
        case refId = "refId"
        case txnAmt = "txnAmt"
        case deviceId = "deviceId"
        case payerLiteAccNumber = "payerLiteAccNumber"
        case txnTimestamp = "txnTimestamp"
        case accountNo = "accountNo"
        case appId = "appId"
        case mobileNo = "mobileNo"
        case payeeName = "payeeName"
        case payerAddress = "payerAddress"
        case payeeAddress = "payeeAddress"
        case referenceWebUrl = "referenceWebUrl"
        case mandateSubType = "mandateSubType"
        case languagePref = "languagePref"
        case token = "token"
        case listKeysXmlPayload = "listKeysXmlPayload"
        case note = "note"
        case npciBankColorCode = "npciBankColorCode"
        case payerBankName = "payerBankName"
        case imageUrl = "imageUrl"
        case resendAadhaarOTPFeature = "resendAadhaarOTPFeature"
        case resendIssuerOTPFeature = "resendIssuerOTPFeature"
        case issuerResendOTPLimit = "issuerResendOTPLimit"
        case aadhaarResendOTPLimit = "aadhaarResendOTPLimit"
        case verifiedMerchant = "verifiedMerchant"
        case forgotUpiPINEnabled = "forgotUpiPINEnabled"
        case captureCardDetails = "captureCardDetails"
        case isAuthOffline = "isAuthOffline"
        case enableUserAuth = "enableUserAuth"
        case getDeviceDetails = "getDeviceDetails"
        
    }
    public init(credType: [String] = [], flowType: String = "", atmPinLength: String? = nil, otpLength: String? = nil, mPinLength: String? = nil, aadharLength: String? = nil, txnID: [String]? = nil, refId: String? = nil, txnAmt: String? = "0.00", deviceId: String, payerLiteAccNumber: String? = nil, txnTimestamp: String? = nil, accountNo: String? = nil, appId: String, mobileNo: String, payeeName: String? = nil, payerAddress: String? = nil, payeeAddress: String? = nil, referenceWebUrl: String? = nil, mandateSubType: String? = nil, languagePref: String? = "en_US", token: String? = nil, listKeysXmlPayload: String? = nil, note: String? = nil, npciBankColorCode: String? = nil, payerBankName: String, imageUrl: String? = nil, resendAadhaarOTPFeature: String = "false", resendIssuerOTPFeature: String = "false", issuerResendOTPLimit: Int = 0, aadhaarResendOTPLimit: Int = 0, verifiedMerchant: String = "false", forgotUpiPINEnabled: String = "false", captureCardDetails: String = "false", isAuthOffline: String = "false", enableUserAuth: String = "false", getDeviceDetails: String = "false") {
        
        self.credType = credType
        self.flowType = flowType
        self.atmPinLength = atmPinLength
        self.otpLength = otpLength
        self.mPinLength = mPinLength
        self.aadharLength = aadharLength
        self.txnID = txnID
        self.refId = refId
        self.txnAmt = txnAmt
        self.deviceId = deviceId
        self.payerLiteAccNumber = payerLiteAccNumber
        self.txnTimestamp = txnTimestamp
        self.accountNo = accountNo
        self.appId = appId
        self.mobileNo = mobileNo
        self.payeeName = payeeName
        self.payerAddress = payerAddress
        self.payeeAddress = payeeAddress
        self.referenceWebUrl = referenceWebUrl
        self.mandateSubType = mandateSubType
        self.languagePref = languagePref
        self.token = token
        self.listKeysXmlPayload = listKeysXmlPayload
        self.note = note
        self.npciBankColorCode = npciBankColorCode
        self.payerBankName = payerBankName
        self.imageUrl = imageUrl
        self.resendAadhaarOTPFeature = resendAadhaarOTPFeature
        self.resendIssuerOTPFeature = resendIssuerOTPFeature
        self.issuerResendOTPLimit = issuerResendOTPLimit
        self.aadhaarResendOTPLimit = aadhaarResendOTPLimit
        self.verifiedMerchant = verifiedMerchant
        self.forgotUpiPINEnabled = forgotUpiPINEnabled
        self.captureCardDetails = captureCardDetails
        self.isAuthOffline = isAuthOffline
        self.enableUserAuth = enableUserAuth
        self.getDeviceDetails = getDeviceDetails
    }
    
}



   
