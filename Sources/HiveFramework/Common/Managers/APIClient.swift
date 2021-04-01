//
//  APIClient.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/7/21.
//

import Foundation
import Combine


public typealias CompletionHandler = (_ success : Bool) -> Void



enum APIPath: String {
    case GetTokenUrl = "Authentication/GetToken"
    case GetRelevantWebSurvey = "Survey/GetRelevantWebSurvey"
    case SaveWebSurveyResponse = "CustomerSurvey/SaveWebSurveyResponse"
}

public struct APIClient {
    let baseUrl = URL(string: "http://13.69.99.146:8070/api/")!

    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request) // 3
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


// get token API
extension APIClient
{
    func getToken(username: String, password: String) -> AnyPublisher<TokenResponseModel, Error> {
        // Prepare URL
        let url = URL(string: "\(baseUrl)\(APIPath.GetTokenUrl.rawValue)")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "username=\(username)&password=\(password)&grant_type=password";

        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        return run(request) 
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

// refresh token API
extension APIClient
{
    func refreshToken(username: String, refreshToken: String) -> AnyPublisher<TokenResponseModel, Error> {
        // Prepare URL
        let url = URL(string: "\(baseUrl)\(APIPath.GetTokenUrl.rawValue)")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "username=\(username)&refresh_token=\(refreshToken)&grant_type=refresh_token";

        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        return run(request) // 5
            .map(\.value) // 6
            .eraseToAnyPublisher() // 7
    }
}


// GetRelevantWebSurvey API
extension APIClient
{
    func getRelevantWebSurvey(authorization: String, language: String, customerName: String, customerEmail: String, customerPhoneNumber: String) -> AnyPublisher<SurveyResponseModel, Error> {
        // Prepare URL
        let url = URL(string: "\(baseUrl)\(APIPath.GetRelevantWebSurvey.rawValue)")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(authorization, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        
        // prepare jsonBody data
        let surveyBody = SurveyRequestBody(customercic: "", language: language, channel: "InApp", customername: customerName, customerEmail: customerEmail, customerphonenumber: customerPhoneNumber, dipositioncodes: [])
       
        let jsonData = try? JSONEncoder().encode(surveyBody)

        // Set HTTP Request Body
        request.httpBody = jsonData
        
        return run(request) // 5
            .map(\.value) // 6
            .eraseToAnyPublisher() // 7
    }
}

// SaveWebSurveyResponse API
extension APIClient
{
    func SaveWebSurveyResponse(authorization: String, InvitationGuid: String, SurveyGuid: String, SurveyID: Int, questionResponses: [QuestionsResponse]) -> AnyPublisher<SaveSurveyResponseModel, Error> {
        // Prepare URL
        let url = URL(string: "\(baseUrl)\(APIPath.SaveWebSurveyResponse.rawValue)")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(authorization, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        
        // prepare jsonBody data
        let saveSurveyBody = SaveSurveyRequestBody(InvitationGuid: InvitationGuid, SurveyGuid: SurveyGuid, SurveyID: SurveyID, QuestionResponses: questionResponses)
       
        let jsonData = try? JSONEncoder().encode(saveSurveyBody)

        // Set HTTP Request Body
        request.httpBody = jsonData
        
        return run(request) // 5
            .map(\.value) // 6
            .eraseToAnyPublisher() // 7
    }
}

