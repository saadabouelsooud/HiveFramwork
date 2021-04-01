////
////  SDKViewModel.swift
////  HiveFramework
////
////  Created by Saad Abou elsoo'oud on 3/29/21.
////
//
//import Foundation
//import SwiftUI
//class BaseViewModel: ViewModel
//{
//    @Published
//    var state: SDKState
//
//    init(username: String, password: String) {
//        state = SDKState()
//        state.tokenResponseWrapper = TokenResponseWrapper()
//        state.tokenResponseWrapper.username = username
//        state.tokenResponseWrapper.password = password
//        self.state.tokenResponseWrapper.getToken(completionHandler:
//        { success in
//            if(success)
//                {
//            self.state.surveyResponseWrapper = SurveyResponseWrapper()
//            self.state.surveyResponseWrapper.tokenResponseWrapper = self.state.tokenResponseWrapper
//                }
//        })
//    }
//    
//    
//    func trigger(_ input: SDKInput) {
//        switch input {
//        case .fillData:
//            filLists()
//        case .select:
//           break /// should be implemented
//        case .submitAnswers:
//            break /// should be implemented
//        }
//    }
//    
//    
//    func filLists()
//    {
//        state.questionsList = (state.surveyResponseWrapper.surveyResponse.survey?.questions)!
//        let questionTitleStyle = (state.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.theme?.questionTitleStyle)!
//        
//        for question in state.questionsList {
//            switch question.questionType
//              {
//               case QuestionType.Emoji.rawValue:
//                let emojiViewmodel = AnyViewModel(EmojiViewModel(selectedIndex: -1, title: question.title!, titleStyle: questionTitleStyle))
//                let emojiView =  AnyView (EmojiView(viewModel: emojiViewmodel)
//                    .cornerRadius(25))
//                state.questionsViewModelList.append(emojiViewmodel)
//                state.questionsViewlList.append(emojiView)
//                
//               case QuestionType.NPS.rawValue:
//                let npsViewmodel = AnyViewModel(NPSViewModel(selectedIndex: -1, title: question.title!, titleStyle: questionTitleStyle))
//                let npsView =  AnyView (NPSView(viewModel: npsViewmodel)
//                    .cornerRadius(25))
//                state.questionsViewModelList.append(npsViewmodel)
//                state.questionsViewlList.append(npsView)
//                
//               default:
//                  break
//              }
//        }
//
//    }
//    
////    func updateQuestionsProgress()
////    {
////        let questionsCount = (state.surveyResponseWrapper.surveyResponse.survey?.questions!.count)!
////        let questionsFloatCount = CGFloat (questionsCount)
////        state.questionsProgress = ((state.currentQuestionIndex + 1.0)/questionsFloatCount)*100
////    }
////    
////    func goLeft()
////    {
////        if(state.currentQuestionIndex > 0)
////        {
////            state.currentQuestionIndex -= 1
////            updateQuestionsProgress()
////        }
////    }
////    
////    func goRight()
////    {
////        let questionsCount = (state.surveyResponseWrapper.surveyResponse.survey?.questions!.count)!
////        let currentIndex = Int(state.currentQuestionIndex)
////        if( currentIndex < questionsCount-1)
////        {
////            state.currentQuestionIndex += 1
////            updateQuestionsProgress()
////        }
////    }
//
//}
