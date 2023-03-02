//
//  CredAllowed.swift
//  
//
//  Created by orange on 02/02/23.
//

import Foundation

/**
 * This method specifies the schema for the credential(s) to be captured, which is in JSON String Format.
 * Common library reads this data and generates the Controls.
 * The list of these credentials are to be captured by the PSP app from ListAccountResponse API. Example is as below:
 * 1.If the bank supports FORMAT1 CARDPIN Data block will not be there.
 * Example for Format1:
 * {"CredAllowed": [{"type": "OTP", "subtype": "SMS", "dType": "NUM", "dLength": "6"},
 * {"type": "PIN", "subtype": "MPIN", "dType": "NUM", "dLength": "6"}]}
 *
 * 2.If Bank supports FORMAT2,CARDPIN data block should be part of the credAllowed block.
 * Example for Format2:
 * { "CredAllowed": [ {"type": "OTP", "subtype": "SMS", "dType": "NUM", "dLength": "6"},
 * {"type": "PIN", "subtype": "ATMPIN", "dType": "NUM", "dLength": "4"},
 * {"type": "PIN", "subtype": "MPIN", "dType": "NUM", "dLength": "6"} ]
 *
 * 3.a If the bank supports "FORMAT3|FORMAT2" or "FORMAT3|FORMAT1" functionality and Aadhaar consent is provided in the app, Aadhar OTP data block should be part of the credAllowed block [CL will capture Aadhar OTP, Issuer OTP and MPIN].
 * Example :
 * {"CredAllowed": [{"type": "OTP", "subtype": "SMS", "dType": "NUM", "dLength": "6"},
 * {"type": "PIN", "subtype": "MPIN", "dType": "NUM", "dLength": "6"},
 * {"type": "OTP", "subtype": "AADHAAR", "dType": "NUM", "dLength": "6"} ]}
 *
 * 3.b If Aadhar consent is not provided by the user, app has to use fallback mechanism and use either FORMAT1 or FORMAT2(based on fallback format received, either “FORMAT3|FORMAT1” or either “FORMAT3|FORMAT2”), in this case card details will be captured inside the CL.
 * Example:
 * 1.For Format3|Format1 fallback, please refer to example in point # 1
 * 2. For Format3|Format2 fallback, please refer to example in point # 2
 *
 * In case of UPI Lite On-boarding, PSP App should check if the ListAccountResponse for an account has the “liteEnabled” flag value as “True”. If so, during the onboarding process, add following block for DEVICE in CredAllowed Array:
 *  {"type": "DEVICE", "subType": "IDENTITY", "dType": "ALPH", "dLength": "2048" }
 *
 *  In case of UPI Lite Load Money, add following object:
 *  { "CredAllowed": [{"type": "ARQC", "subtype": "SIGNATURE", "dType": "ALPH", "dLength": "2048"},
 *  {"type": "PIN","subtype": "MPIN", "dType": "NUM", "dLength": "4"},}
 *
 *  In case of UPI Lite transaction, only following object suffice as CredAllowed singleton array:
 *  {"type": "ARQC", "subType": "SIGNATURE", "dType": "ALPH", "dLength": "2048 }
 *
 * Based on the number of blocks in the JSON, one or more credential input control will be rendered by the common library.
 *
 */

func getCredBlocksControl(clRequestParams: CLRequestParams) -> Dictionary<AnyHashable, Any> {
    var flowType : String?
    flowType = clRequestParams.flowType
    switch flowType { // pending to check the format.
        case FlowType().CHANGE_PIN:
            let pinCredsAllowed = ["type": "PIN",
                                   "subtype": "MPIN",
                                   "dtype": "NUM", //  "NUM | ALPH",
                                   "dlength":clRequestParams.mPinLength]
            
            let mPinCredsAllowed = ["type": "PIN",
                                    "subtype": "NMPIN",
                                    "dtype": "NUM", // "NUM | ALPH",
                                    "dlength": clRequestParams.mPinLength]
        
        
            
            let credsAllowed = [pinCredsAllowed,mPinCredsAllowed]
            let json = ["CredAllowed": credsAllowed]
            
            return json
            
        case FlowType().SET_PIN :
            if (clRequestParams.aadharLength != nil) {
                let aadhaarCredsAllowed = ["type": "OTP",
                                           "subtype": "AADHAAR",
                                           "dtype": "NUM",
                                           "dlength": clRequestParams.aadharLength]
                
                let smsCredsAllowed = ["type": "OTP",
                                       "subtype":"SMS",
                                       "dtype": "NUM",
                                       "dlength": clRequestParams.otpLength]
                
                let mPinCredsAllowed = ["type": "PIN",
                                        "subtype": "MPIN",
                                        "dtype": "NUM",
                                        "dlength": clRequestParams.mPinLength]
                
                let credsAllowed = [aadhaarCredsAllowed,smsCredsAllowed,mPinCredsAllowed]
                let json = ["CredAllowed": credsAllowed]
                
                return json
            } else if (clRequestParams.atmPinLength != nil) {
                let smsCredsAllowed = ["type": "OTP",
                                       "subtype":"SMS",
                                       "dtype": "NUM",
                                       "dlength": clRequestParams.otpLength]
                
                let atmCredsAllowed = ["type": "PIN",
                                       "subtype": "ATMPIN",
                                       "dtype": "NUM",
                                       "dlength": clRequestParams.atmPinLength]
                
                let mPinCredsAllowed = ["type": "PIN",
                                        "subtype": "MPIN",
                                        "dtype": "NUM",
                                        "dlength": clRequestParams.mPinLength]
                
                let credsAllowed = [smsCredsAllowed,atmCredsAllowed, mPinCredsAllowed]
                let json = ["CredAllowed": credsAllowed]
                
                return json
                
                
            } else {
                let mpinCredsAllowed = ["type": "PIN",
                                        "subtype":"MPIN",
                                        "dtype":"NUM",
                                        "dlength":clRequestParams.mPinLength]
                let smsCredsAllowed = ["type": "OTP",
                                       "subtype":"SMS",
                                       "dtype":"NUM",
                                       "dlength":clRequestParams.otpLength]
                
                let credsAllowed = [mpinCredsAllowed,smsCredsAllowed]
                let json = ["CredAllowed": credsAllowed]
                
                return json
                
            }
            
        case FlowType().REQ_BAL_CHK, FlowType().REQ_BAL_ENQ, FlowType().MANDATE, FlowType().COLLECT, FlowType().PAY:
            
            //add for req bal chk, add for req bal enq, mandate, collect, pay,
            let credsAllowed = ["type": "PIN",
                                "subtype": "MPIN",
                                "dtype": "NUM",
                                "dlength": clRequestParams.mPinLength]
            let json = ["CredAllowed": credsAllowed]
            return json
            
            
        case FlowType().PAY_AND_REQ_BAL_CHK, FlowType().COLLECT_AND_REQ_BAL_CHK:
            // add for [pay,reqBalChk], [collect,reqBalChk]
            let mpinCredsAllowed = ["type": "PIN",
                                    "subtype": "MPIN",
                                    "dtype": "NUM",
                                    "dlength": clRequestParams.mPinLength]
            let smsCredsAllowed = ["type": "PIN",
                                   "subtype": "MPIN",
                                   "dtype": "NUM",
                                   "dlength": clRequestParams.mPinLength]
            
            let credsAllowed = [mpinCredsAllowed, smsCredsAllowed]
            let json = ["CredAllowed": credsAllowed]
            
            return json
            
            
        default:
            let credsAllowed = ["type": "PIN",
                                "subtype": "MPIN",
                                "dtype": "NUM",
                                "dlength": clRequestParams.mPinLength]
            let json = ["CredAllowed": credsAllowed]
            return json
            
    }
}
