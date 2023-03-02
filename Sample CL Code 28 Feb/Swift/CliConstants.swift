//
//  cliContants.swift
//  
//
//  Created by ShashiTiwari on 02/02/23.
//

import Foundation

class LanguagePrefConstant {
    
    let ENGLISH_US = "en_US"
    let HINDI = "hi_IN"
    let ASSAMESE  = "as_IN"
    let BENGALI  = "bn_IN"
    let BHOJPURI  = "bho_IN"
    let GUJARATI = "gu_IN"
    let KANNADA  = "kn_IN"
    let KHASI  = "kha_IN"
    let KONKANI  = "kok_IN"
    let MARATHI  = "mr_IN"
    let MANIPURI  = "mni_IN"
    let MARWARI  = "mwr_IN"
    let MALAYALAM  = "ml_IN"
    let ORIYA = "or_IN"
    let PUNJABI  = "pa_IN"
    let TAMIL  = "ta_IN"
    let TELUGU  = "te_IN"
    let URDU  = "ur_IN"
}

let languagePrefConst = LanguagePrefConstant()
/// `Supported language Array:` To check the if user added the language that is supported by NPCI
var languageList = [ languagePrefConst.ENGLISH_US,
                     languagePrefConst.HINDI,
                     languagePrefConst.ASSAMESE,
                     languagePrefConst.BENGALI,
                     languagePrefConst.BHOJPURI,
                     languagePrefConst.GUJARATI,
                     languagePrefConst.KANNADA,
                     languagePrefConst.KHASI,
                     languagePrefConst.KONKANI,
                     languagePrefConst.MARATHI,
                     languagePrefConst.MANIPURI,
                     languagePrefConst.MARWARI,
                     languagePrefConst.MALAYALAM,
                     languagePrefConst.ORIYA,
                     languagePrefConst.PUNJABI,
                     languagePrefConst.TAMIL,
                     languagePrefConst.TELUGU,
                     languagePrefConst.URDU ]

func getLanguagePreference(languagePref: String) -> String {
    if languageList.contains(languagePref) {
        return languagePref
    } else {
        return languagePrefConst.ENGLISH_US
    }
}
