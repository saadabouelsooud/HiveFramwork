//
//  CircleNPSViewModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/15/21.
//

import Foundation
class NPSViewModel: ViewModel {
    @Published
    var state: NPSViewState
    
    
    init(selectedIndex: Int, title: String, titleStyle: QuestionTitleStyleModel) {
        let numberedCircleList : [NumberedCircle] = [
            NumberedCircle(numberResponse: 0,circleHexColor:"e43e3d"),
            NumberedCircle(numberResponse: 1,circleHexColor:"e43e3d"),
            NumberedCircle(numberResponse: 2,circleHexColor:"ea484d"),
            NumberedCircle(numberResponse: 3,circleHexColor:"ec654e"),
            NumberedCircle(numberResponse: 4,circleHexColor:"f3a84c"),
            NumberedCircle(numberResponse: 5,circleHexColor:"f8c43e"),
            NumberedCircle(numberResponse: 6,circleHexColor:"e1c63b"),
            NumberedCircle(numberResponse: 7,circleHexColor:"e1c63b"),
            NumberedCircle(numberResponse: 8,circleHexColor:"9fce35"),
            NumberedCircle(numberResponse: 9,circleHexColor:"7fcd31"),
            NumberedCircle(numberResponse: 10,circleHexColor:"5aaf2b"),
        ]
        let selectedNumberResponse = -1
        state = NPSViewState(npsRatesList: numberedCircleList, selectedNumberResponse: selectedNumberResponse, selectedIndex: selectedIndex, title: title, titleStyle: titleStyle)
    }
    
    func trigger(_ input: NPSViewInput) {
        switch input {
        case .selectNPSAnswer(let index):
            state.selectedIndex = index
            state.selectedNumberResponse = state.npsRatesList[index].numberResponse
            let questions = (HiveFramework.shared!.surveyResponseWrapper.surveyResponse.survey?.questions)!
             for question in questions{
                if(question.questionType == QuestionType.NPS.rawValue)
                {
                    let questionsResponse = QuestionsResponse(questionGuid:question.questionGUID,questionID:question.questionID,selectedChoices:[],numberResponse: state.selectedNumberResponse,textResponse:"")
                    HiveFramework.shared!.questionsResponses.append(questionsResponse)
                }
               }
        }
    }

}
