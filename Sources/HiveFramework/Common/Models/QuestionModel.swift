//
//  QuestionModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/10/21.
//

import Foundation
struct QuestionModel : Codable {
    let questionGUID : String?
    let questionID : Int?
    let title : String?
    let isRequired : Bool?
    let questionType : Int?
    let choices : [String]?
    let starOption : String?

    enum CodingKeys: String, CodingKey {

        case questionGUID = "QuestionGUID"
        case questionID = "QuestionID"
        case title = "Title"
        case isRequired = "IsRequired"
        case questionType = "QuestionType"
        case choices = "Choices"
        case starOption = "StarOption"
    }

}
