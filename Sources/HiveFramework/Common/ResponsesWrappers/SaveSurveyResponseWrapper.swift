//
//  SaveSurveyResponseWrapper.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/27/21.
//

import Foundation
import Combine

public class SaveSurveyResponseWrapper {
    public var _surveyResponse : SaveSurveyResponseModel? = nil
    var cancellationToken: AnyCancellable?
    private let apiClient = APIClient()
    private var _tokenResponseWrapper = TokenResponseWrapper()
    public var saveSurveyResponse: SaveSurveyResponseModel
    {
        set{_surveyResponse = newValue}
        get{return _surveyResponse!}
    }
    public var tokenResponseWrapper: TokenResponseWrapper
    {
        set{_tokenResponseWrapper = newValue}
        get{return _tokenResponseWrapper}
    }

    public func SaveWebSurveyResponse (surveyModel: SurveyModel, questionResponses:[QuestionsResponse], completionHandler: @escaping CompletionHandler) {
        print("inside SaveWebSurveyResponse")
        cancellationToken = apiClient.SaveWebSurveyResponse(authorization: (self.tokenResponseWrapper.authorization)!, InvitationGuid: surveyModel.invitationGuid!, SurveyGuid: surveyModel.surveyGuid!, SurveyID: surveyModel.surveyID!, questionResponses: questionResponses)
                    .mapError({ (error) -> Error in
                        print(error)
                        return error
                    })
                    .sink(receiveCompletion: { _ in },
                          receiveValue: {
                            print(" success and reponse is \($0)")
                            self.saveSurveyResponse = $0
                            completionHandler(true)
//                            self.themeManager.themeModel = (self.surveyResponse.survey?.surveyOptions?.theme)!
//                            print("theme manager wrapped obje is \(self.themeManager)")
                    })
    }
}
