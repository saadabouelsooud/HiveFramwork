//
//  SaveSurveyRequestBody.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/25/21.
//

import Foundation
struct SaveSurveyRequestBody : Codable {
    var InvitationGuid: String?
    var SurveyGuid: String?
    var SurveyID: Int?
    var QuestionResponses :[QuestionsResponse]?
}
