//
//  SaveSurveyResponseModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/27/21.
//

import Foundation
public struct SaveSurveyResponseModel : Codable {
    let isSuccess : Bool?
    let message : String?
    let statusCode : Int?

    enum CodingKeys: String, CodingKey {

        case isSuccess = "IsSuccess"
        case message = "Message"
        case statusCode = "StatusCode"
    }

}
