//
//  SurveyResponseModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/10/21.
//

import Foundation
public struct SurveyResponseModel : Codable {
    let isSuccess : Bool?
    let message : String?
    let statusCode : Int?
    let survey : SurveyModel?

    enum CodingKeys: String, CodingKey {

        case isSuccess = "IsSuccess"
        case message = "Message"
        case statusCode = "StatusCode"
        case survey = "Survey"
    }

}
