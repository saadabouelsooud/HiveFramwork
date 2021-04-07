//
//  SubmitButtonView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/24/21.
//

import SwiftUI

struct SubmitButtonView: View {
    @ObservedObject var sdkState: HiveFramework
    var viewModel : AnyViewModel<DisplayModeViewState,DisplayModeViewInput>
    
    var body: some View {
        let canSubmit = sdkState.questionsProgress == 100.0
        let submitButtonStyle = sdkState.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.theme?.submitButton
        let fontSize = CGFloat(Float(((submitButtonStyle?.fontSize!.deletingSuffix("px"))!))!)
        
        let surveyModel = sdkState.surveyResponseWrapper.surveyResponse.survey
        let questionResponses = sdkState.questionsResponses

        
        Button(action: {
            self.submitAnswers(surveyModel: surveyModel!, questionResponses: questionResponses, completionHandler: { isSurveySaved in
                if(isSurveySaved)
                {
                    self.viewModel.sdkState.isSurveysaved = true
                }
                
            })
        }, label: {
            HStack()
            {
                Image(canSubmit ? "submit-enabled" : "submit-disabled", bundle: Bundle.module)/// module will be auto generated in runtime
                .padding(.bottom, -25)


                Text(LanguageManager.shared.localizationStrings[Placeholders.SubmitBtnTxt] ?? "SubmitBtnTxt")
                    .underline((submitButtonStyle?.fontUnderline!)!)
                    .italic(enabled: (submitButtonStyle?.fontItalic!)!)
                    .font(.custom((submitButtonStyle?.fontFamily!)!, size: fontSize))
                    .foregroundColor(Color(hex: canSubmit ? (submitButtonStyle?.fontColor!)! : (submitButtonStyle?.hoverFontColor!)!))
                    .fontWeight((submitButtonStyle?.fontBold!)! ? .bold : .none)
                    .padding(-25)
            }
        })
        .disabled(!canSubmit)
        .frame(width: 180, height: 50)
        .overlay(
              RoundedRectangle(cornerRadius: 25)
            .stroke(Color(hex: (submitButtonStyle?.borderColor!)!), lineWidth: 1)
                )
        .background(RoundedRectangle(cornerRadius: 25).fill(Color(hex: canSubmit ? (submitButtonStyle?.backgroundColor!)!: (submitButtonStyle?.hoverBackground!)!)))
        
    }
}

// MARK: - Private extension
private extension SubmitButtonView {
    func submitAnswers(surveyModel: SurveyModel, questionResponses: [QuestionsResponse], completionHandler: @escaping CompletionHandler) {
    viewModel.trigger(.submitAnswers(surveyModel: surveyModel, questionResponses: questionResponses, completionHandler: completionHandler))
    }
}


//struct SubmitButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubmitButtonView(sdkState: HiveFramework.shared!)
//    }
//}
