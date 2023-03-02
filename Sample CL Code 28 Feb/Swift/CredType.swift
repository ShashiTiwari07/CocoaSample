//
//  File.swift
//  
//
//  Created by orange on 02/02/23.
//

import Foundation

class CredType {
    let PAY = "pay"
    let COLLECT = "collect"
    let REQ_BAL_ENQ = "reqBalEnq"
    let REQ_BAL_CHK = "reqBalChk"
    let PAY_AND_REQ_BAL_CHK = "[pay, reqBalChk]"
    let COLLECT_AND_REQ_BAL_CHK = "[collect, reqBalChk]"
    
    /*
     * For Mobile banking registration and set/forgot UPI PIN
     */
    let SET_PIN = "setMpin"
    let CHANGE_PIN = "changeMpin"
    let MANDATE = "mandate"
    let BINDING = "binding"
}

class FlowType: NSObject {
    
    let PAY = "pay"
    let COLLECT = "collect"
    let REQ_BAL_ENQ = "reqBalEnq"
    let REQ_BAL_CHK = "reqBalChk"
    let PAY_AND_REQ_BAL_CHK = "payReqBalChk"
    let COLLECT_AND_REQ_BAL_CHK = "collectReqBalChk"
    /*    * For Mobile banking registration and set/forgot UPI PIN     */
    let SET_PIN = "setMpin"
    let CHANGE_PIN = "changeMpin"
    let MANDATE = "mandate"
    let BINDING = "binding"
}
