//
//  File.swift
//  
//
//  Created by orange on 31/01/23.
//

import Foundation

public class UpiLib: NSObject {
    //    let clServices = CLServices.self
    
    public static let sharedInstance = UpiLib()
    public func getChallengeAPI(deviceId: String, type: String, appId: String, completion: @escaping (_ isChallenge: String) -> ()){
        let Challenge = UpiCommonLib.sharedInstance.getChallenge(deviceId: deviceId, type: type, appId: appId)
        completion(Challenge)
    }
    
    public func registerAPI(appId: String, deviceid: String, keyToken: String, mobile: String, completion: @escaping (_ register: Bool) -> ()) {
        let isRegister = UpiCommonLib.sharedInstance.register(appId: appId, deviceid: deviceid, keyToken: keyToken, mobile: mobile)
        completion(isRegister)
    }
    
    public func getcredentialAPI(keyCode: String, clReqParam: CLRequestParams, completion: @escaping (_ register: Bool) -> ()) {
        let credential = UpiCommonLib.sharedInstance.getCredentials(keyCode: keyCode, clReqParam: clReqParam)
        completion(credential)
    }
}
