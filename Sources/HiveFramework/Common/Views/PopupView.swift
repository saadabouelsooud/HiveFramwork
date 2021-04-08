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
    
    @State var closeSurvey : Bool = false

    let questionViewBuilder = QuestionViewBuilder()


    init(sdkState: HiveFramework) {
        self.viewModel = AnyViewModel(DisplayModeViewModel(sdkState: sdkState))
    }
    
    public var body: some View{
        let questions = (viewModel.sdkState.surveyResponseWrapper.surveyResponse.survey?.questions)!
        let surveyBackgroundColor = (viewModel.sdkState.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.theme?.surveyBackgroundColor)!
        
        if(!closeSurvey)
        {
         Popup(isPresented: true, alignment: .center, direction: .top) {
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

                
                  PopupSurveyTitleView(sdkState: HiveFramework.shared!)
                 .padding()

                    
                VStack(alignment: .center)
                   {
                    
                     QuestionsPagerView(isPopup: viewModel.sdkState.isPopup, sdkState: HiveFramework.shared!, pageCount: questions.count, content:
                         {
                          ForEach(0..<questions.count)
                            { index in
                             self.questionViewBuilder.build(question: questions[index])
                            }
                         })
                    
                    SurveyNavigationView(sdkState: HiveFramework.shared!, isPopup: viewModel.sdkState.isPopup)
                    .frame(alignment: .center)

                   }
                 
                Spacer().frame(height: 20)

                   
                SubmitButtonView(sdkState: HiveFramework.shared!, viewModel: viewModel)
                    .frame(alignment: .center)

                
                Spacer().frame(height: 10)
                }
                .environment(\.layoutDirection, LanguageManager.shared.isRightToLeft ? .rightToLeft : .leftToRight)
                .background(Color(hex: surveyBackgroundColor).opacity(0.1))
        }
        .popupContent()
       }
        
    }
      
 }

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(sdkState: HiveFramework.shared!)
    }
}
