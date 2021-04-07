//
//  SurveyModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/10/21.
//

import Foundation
public struct SurveyModel : Codable {
    let invitationGuid : String?
    let surveyGuid : String?
    let surveyID : Int?
    let name : String?
    let title : String?
    let surveyLanguage : Int?
    let surveyOptions : SurveyOptionsModel?
    let questions : [QuestionModel]?
    let skipLogics : [String]?

    enum CodingKeys: String, CodingKey {

        case invitationGuid = "InvitationGuid"
        case surveyGuid = "SurveyGuid"
        case surveyID = "SurveyID"
        case name = "Name"
        case title = "Title"
        case surveyLanguage = "SurveyLanguage"
        case surveyOptions = "SurveyOptions"
        case questions = "Questions"
        case skipLogics = "SkipLogics"
    }
}
