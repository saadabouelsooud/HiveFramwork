//
//  EmojiViewModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/15/21.
//

import Foundation
class EmojiViewModel: ViewModel {
    @Published
    var state: EmojiViewState
    
    init(selectedIndex: Int, title: String, titleStyle: QuestionTitleStyleModel) {
        let emojiRatesList = [
            EmojiRateModel(imageName: "angry", rateString: "angry",isSelected: false, numberResponse: 1),
            EmojiRateModel(imageName: "smile", rateString: "smile",isSelected: false, numberResponse: 2),
            EmojiRateModel(imageName: "good", rateString: "good",isSelected: false, numberResponse: 3),
            EmojiRateModel(imageName: "happy", rateString: "happy",isSelected: false, numberResponse: 4),
            EmojiRateModel(imageName: "love", rateString: "love",isSelected: false, numberResponse: 5)
        ]
        let selectedNumberResponse = -1
        state = EmojiViewState(emojiRatesList: emojiRatesList, selectedNumberResponse: selectedNumberResponse, selectedIndex: selectedIndex,title: title,titleStyle: titleStyle)
    }
    
    func trigger(_ input: EmojiViewInput) {
        switch input {
        case .selectAnswer(let index):
            state.selectedIndex = index
            state.selectedNumberResponse = state.emojiRatesList[index].numberResponse
            let questions = (HiveFramework.shared!.surveyResponseWrapper.surveyResponse.survey?.questions)!
             for question in questions {
                if(question.questionType == QuestionType.Emoji.rawValue)
                {
                    let questionsResponse = QuestionsResponse(questionGuid:question.questionGUID,questionID:question.questionID,selectedChoices:[],numberResponse: state.selectedNumberResponse,textResponse:"")
                    HiveFramework.shared!.questionsResponses.append(questionsResponse)
                }
               }
        }
    }
    
}
