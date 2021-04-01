//
//  BaseViewModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/27/21.
//

import Foundation
class DisplayModeViewModel: ViewModel {
    @Published
    var state: DisplayModeViewState
    
    init(sdkState: HiveFramework) {
        state = DisplayModeViewState(sdkState: sdkState)
    }
    
    func trigger(_ input: DisplayModeViewInput) {
        switch input {
         case .submitAnswers(let surveyModel, let questionResponses,let completionHandler):
            state.sdkState.saveSurveyResponseWrapper.SaveWebSurveyResponse(surveyModel: surveyModel, questionResponses: questionResponses, completionHandler: completionHandler)
        }
    }
    
}
