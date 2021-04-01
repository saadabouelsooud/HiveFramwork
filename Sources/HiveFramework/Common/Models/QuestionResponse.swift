//
//  QuestionResponse.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/25/21.
//

import Foundation
import Foundation
public struct QuestionsResponse : Codable {
    let questionGuid : String?
    let questionID : Int?
    let selectedChoices : [String]?
    let numberResponse : Int?
    let textResponse : String?

    enum CodingKeys: String, CodingKey {

        case questionGuid = "QuestionGuid"
        case questionID = "QuestionID"
        case selectedChoices = "SelectedChoices"
        case numberResponse = "NumberResponse"
        case textResponse = "TextResponse"
    }
}
