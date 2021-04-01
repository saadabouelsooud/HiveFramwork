//
//  ThemeModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/10/21.
//

import Foundation
public struct ThemeModel : Codable {
    let startScreenMsg : String?
    let endScreenMsg : String?
    let surveyBackgroundColor : String?
    let focusColor : String?
    let titleOrientation : String?
    let surveyTitleStyle : SurveyTitleStyleModel?
    let questionTitleStyle : QuestionTitleStyleModel?
    let questionChoicesStyle : QuestionChoicesStyleModel?
    let startScreenMsgStyle : StartScreenMsgStyleModel?
    let endScreenMsgStyle : EndScreenMsgStyleModel?
    let inputAnswerStyle : InputAnswerStyleModel?
    let surveyLogoStyle : SurveyLogoStyleModel?
    let submitButton : SubmitButtonModel?

    enum CodingKeys: String, CodingKey {

        case startScreenMsg = "StartScreenMsg"
        case endScreenMsg = "EndScreenMsg"
        case surveyBackgroundColor = "SurveyBackgroundColor"
        case focusColor = "FocusColor"
        case titleOrientation = "TitleOrientation"
        case surveyTitleStyle = "SurveyTitleStyle"
        case questionTitleStyle = "QuestionTitleStyle"
        case questionChoicesStyle = "QuestionChoicesStyle"
        case startScreenMsgStyle = "StartScreenMsgStyle"
        case endScreenMsgStyle = "EndScreenMsgStyle"
        case inputAnswerStyle = "InputAnswerStyle"
        case surveyLogoStyle = "SurveyLogoStyle"
        case submitButton = "SubmitButton"
    }

}
