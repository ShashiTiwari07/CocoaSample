//
//  ConfigurationParams.swift
//  
//
//  Created by ShashiTiwari on 31/01/23.
//

import Foundation

public struct ConfigurationParams {
    var payerBankName: String
    var imageUrl: String?
    var resendAadhaarOTPFeature: String?  //New feature
    var resendIssuerOTPFeature: String? //New feature
    var issuerResendOTPLimit: Int? //New feature
    var aadhaarResendOTPLimit: Int? //New feature
    var verifiedMerchant: String //New feature
    var forgotUpiPINEnabled: String
    var captureCardDetails: String //New feature
    var isAuthOffline: String //New feature
    var enableUserAuth: String
    var getDeviceDetails: String //New feature
    
    init(payerBankName: String, imageUrl: String? = nil, resendAadhaarOTPFeature: String = "false", resendIssuerOTPFeature: String = "false", issuerResendOTPLimit: Int = 0, aadhaarResendOTPLimit: Int = 0, verifiedMerchant: String = "false", forgotUpiPINEnabled: String = "false", captureCardDetails: String = "false", isAuthOffline: String = "false", enableUserAuth: String = "false", getDeviceDetails: String = "false") {
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
