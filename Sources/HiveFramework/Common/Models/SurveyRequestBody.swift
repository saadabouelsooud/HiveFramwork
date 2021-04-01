//
//  SurveyRequestBody.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/10/21.
//

import Foundation
struct SurveyRequestBody : Codable {
    var customercic : String?
    var language : String?
    var channel : String?
    var customername : String?
    var customerEmail : String?
    var customerphonenumber : String?
    var dipositioncodes : [String]?

}
