//
//  SurveyResponseWrapper.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/10/21.
//

import Foundation
import Combine

public class SurveyResponseWrapper {
    public var _surveyResponse : SurveyResponseModel? = nil
    var cancellationToken: AnyCancellable?
    private let apiClient = APIClient()
//    private var _themeManager = ThemeManager()
    private var _tokenResponseWrapper = TokenResponseWrapper()
    public var surveyResponse: SurveyResponseModel
    {
        set{_surveyResponse = newValue}
        get{return _surveyResponse!}
    }
    public var tokenResponseWrapper: TokenResponseWrapper
    {
        set{_tokenResponseWrapper = newValue}
        get{return _tokenResponseWrapper}
    }
    
//    public var themeManager: ThemeManager
//    {
//        set{_themeManager = newValue}
//        get{return _themeManager}
//    }
    

    public func getRelevantWebSurvey (language: String, customerName: String, customerEmail: String, customerPhoneNumber: String, completionHandler: @escaping CompletionHandler) {
        print("inside GetRelevantWebSurvey")
        cancellationToken = apiClient.getRelevantWebSurvey(authorization: (self.tokenResponseWrapper.authorization)!, language: language, customerName: customerName, customerEmail: customerEmail, customerPhoneNumber: customerPhoneNumber)
                    .mapError({ (error) -> Error in
                        print(error)
                        return error
                    })
                    .sink(receiveCompletion: { _ in },
                          receiveValue: {
                            print(" success and reponse is \($0)")
                            self.surveyResponse = $0
                            completionHandler(true)
//                            self.themeManager.themeModel = (self.surveyResponse.survey?.surveyOptions?.theme)!
//                            print("theme manager wrapped obje is \(self.themeManager)")
                    })
    }
}
