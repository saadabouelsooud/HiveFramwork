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
        
        if(!viewModel.state.sdkState.closeSurvey)
        {
         Popup(isPresented: true, alignment: .center, direction: .top) {
            VStack
                {
                VStack(alignment: .leading)
                {
                Button(action: {
                    viewModel.state.sdkState.closeSurvey = true
                }, label : {
                  Image("close" , bundle: Bundle.module)/// module will be auto generated in runtime
                })
                .frame(width: 40, height: 40, alignment: .leading)

                }
                
                  PopupSurveyTitleView(sdkState: HiveFramework.shared!)
                 .padding()

                    
                 VStack
                   {
                    
                     QuestionsPagerView(isPopup: viewModel.sdkState.isPopup, sdkState: HiveFramework.shared!, pageCount: questions.count, content:
                         {
                          ForEach(0..<questions.count)
                            { index in
                              self.getQuestionsView(question: questions[index])
                            }
                         })
                    
                    SurveyNavigationView(sdkState: HiveFramework.shared!, isPopup: viewModel.sdkState.isPopup)
                   }
                 
                Spacer().frame(height: 25)

                   
                SubmitButtonView(sdkState: HiveFramework.shared!, viewModel: viewModel)
                
                Spacer().frame(height: 10)
                }
                .environment(\.layoutDirection, LanguageManager.shared.isRightToLeft ? .rightToLeft : .leftToRight)
                .background(Color(hex: surveyBackgroundColor).opacity(0.1))
        }
        .popupContent()
       }
        
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
