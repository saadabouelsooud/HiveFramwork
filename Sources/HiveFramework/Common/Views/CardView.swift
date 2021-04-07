//
//  BaseView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/11/21.
//

import SwiftUI

struct DisplayModeViewState {
    var sdkState: HiveFramework
}

enum DisplayModeViewInput {
    case submitAnswers(surveyModel: SurveyModel, questionResponses: [QuestionsResponse], completionHandler: CompletionHandler)
}

public struct CardView: View {

    @ObservedObject
    var viewModel : AnyViewModel<DisplayModeViewState,DisplayModeViewInput>
    
    init(sdkState: HiveFramework) {
        self.viewModel = AnyViewModel(DisplayModeViewModel(sdkState: sdkState))
    }

    
  public var body: some View {
    let questions = (viewModel.sdkState.surveyResponseWrapper.surveyResponse.survey?.questions)!
//    if(!sdkState.closeSurvey)
//     {
      VStack{
        SurveyTitleView(sdkState: viewModel.sdkState)
        .padding()
        .cornerRadius(25)

       
        QuestionsPagerView(isPopup: false, sdkState: viewModel.sdkState, pageCount: questions.count, content:
            {
                ForEach(0..<questions.count){ index in
                    self.getQuestionsView(question: questions[index])
                }
            })
        .cornerRadius(25)

        
        VStack
        {
            SurveyNavigationView(sdkState: viewModel.sdkState, isPopup: false)
            
            SubmitButtonView(sdkState: viewModel.sdkState, viewModel: viewModel)
        }
        
        Spacer().frame(height: 10)

       }
       .cornerRadius(25)
       .environment(\.layoutDirection, LanguageManager.shared.isRightToLeft ? .rightToLeft : .leftToRight)
      .padding(20)
//      }
//    else
//    {
//      EmptyView()
//    }
}
    /// should refactor it & put it in new class
    /// it is in BaseView & Pop up view
    func getQuestionsView(question: QuestionModel) -> AnyView
    {
        let titleStyle = (HiveFramework.shared!.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.theme?.questionTitleStyle)!
          switch question.questionType
            {
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


//struct BaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        BaseView()
//    }
//}
