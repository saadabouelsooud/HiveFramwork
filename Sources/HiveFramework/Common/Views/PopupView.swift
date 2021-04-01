//
//  PopupView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/23/21.
//

import SwiftUI

struct PopupViewState {
    var sdkState: HiveFramework
}

enum PopupViewInput {
    case submitAnswers(surveyModel: SurveyModel, questionResponses: [QuestionsResponse])
}

struct PopupView: View {
    @ObservedObject
    var viewModel : AnyViewModel<DisplayModeViewState,DisplayModeViewInput>

    init(sdkState: HiveFramework) {
        self.viewModel = AnyViewModel(DisplayModeViewModel(sdkState: sdkState))
    }
    
    public var body: some View{
        let questions = (viewModel.sdkState.surveyResponseWrapper.surveyResponse.survey?.questions)!
        let surveyBackgroundColor = (viewModel.sdkState.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.theme?.surveyBackgroundColor)!
        
        Popup(isPresented: true, alignment: .center, direction: .top) {
            VStack
                {
                  PopupSurveyTitleView(sdkState: HiveFramework.shared!)
                    
                 ZStack
                   {
                     QuestionsPagerView(isPopup: true, sdkState: HiveFramework.shared!, pageCount: questions.count, content:
                         {
                          ForEach(0..<questions.count)
                            { index in
                              self.getQuestionsView(question: questions[index])
                            }
                         })
                    
                    SurveyNavigationView(sdkState: HiveFramework.shared!, isPopup: true)
                   }
                 
                Spacer().frame(height: 25)

                   
                SubmitButtonView(sdkState: HiveFramework.shared!, viewModel: viewModel)
                
                Spacer().frame(height: 20)
                }
                .environment(\.layoutDirection, LanguageManager.shared.isRightToLeft ? .rightToLeft : .leftToRight)
                .background(Color(hex: surveyBackgroundColor).opacity(0.1))
        }
        .popupContent()
        
        }
    
    /// should refactor it & put it in new class
    /// it is in BaseView & Pop up view
    func getQuestionsView(question: QuestionModel) -> AnyView
    {
        let titleStyle = (HiveFramework.shared!.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.theme?.questionTitleStyle)!
          switch question.questionType
            {
             case QuestionType.Emoji.rawValue:
                return AnyView (EmojiView(selectedIndex: -1, title: question.title!, titleStyle: titleStyle))
             case QuestionType.NPS.rawValue:
                return AnyView (NPSView(selectedIndex: -1, title: question.title!, titleStyle: titleStyle))
             default:
                return AnyView(EmptyView())
            }
    }

    
 }

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(sdkState: HiveFramework.shared!)
    }
}
