//
//  File.swift
//  
//
//  Created by mac on 4/8/21.
//

import Foundation
import SwiftUI
class QuestionViewBuilder {
    func build(question: QuestionModel) -> AnyView {
        let titleStyle = (HiveFramework.shared!.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.theme?.questionTitleStyle)!
        
        switch question.questionType {
        case QuestionType.Emoji.rawValue:
           return AnyView (EmojiView(selectedIndex: -1, title: question.title!, titleStyle: titleStyle)
               .cornerRadius(25))
        case QuestionType.NPS.rawValue:
           return AnyView (NPSView(selectedIndex: -1, title: question.title!, titleStyle: titleStyle)
               .cornerRadius(25))
        default:
           return AnyView(EmptyView())
        }
    }
}
