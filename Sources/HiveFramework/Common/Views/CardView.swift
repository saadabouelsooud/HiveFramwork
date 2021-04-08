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
    
    @State var closeSurvey : Bool = false
    
    let questionViewBuilder = QuestionViewBuilder()
    
    init(sdkState: HiveFramework) {
        self.viewModel = AnyViewModel(DisplayModeViewModel(sdkState: sdkState))
    }

    
  public var body: some View {
    let questions = (viewModel.sdkState.surveyResponseWrapper.surveyResponse.survey?.questions)!
    if(!closeSurvey)
     {
        VStack
      {
        

            HStack
            {
                Spacer()
                
        Button(action: {
            closeSurvey = true
            HiveFramework.shared!.closeSurvey = true
        }, label : {
          Image("close" , bundle: Bundle.module)/// module will be auto generated in runtime
        })
            }
            .frame(height: 10)
                
        SurveyTitleView(sdkState: viewModel.sdkState)
        .padding()
        .cornerRadius(25)

       
        QuestionsPagerView(isPopup: viewModel.sdkState.isPopup, sdkState: viewModel.sdkState, pageCount: questions.count, content:
            {
                ForEach(0..<questions.count){ index in
                    self.questionViewBuilder.build(question: questions[index])
                }
            })
        .cornerRadius(20)

        
        VStack(alignment: .center)
        {
            SurveyNavigationView(sdkState: viewModel.sdkState, isPopup: viewModel.sdkState.isPopup)
            
            SubmitButtonView(sdkState: viewModel.sdkState, viewModel: viewModel)
            .frame(alignment: .center)

        }

        
        Spacer().frame(height: 10)

       }
       .cornerRadius(25)
       .environment(\.layoutDirection, LanguageManager.shared.isRightToLeft ? .rightToLeft : .leftToRight)
      .padding(20)
      }
}

}


//struct BaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        BaseView()
//    }
//}
