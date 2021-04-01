//
//  GetTokenResponse.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/7/21.
//

import Foundation
import Combine



public class TokenResponseWrapper {
    public var tokenResponse: TokenResponseModel?
    var cancellationToken: AnyCancellable?
    private let apiClient = APIClient()
    private var _username: String = ""
    private var _password: String = ""
    public var authorization: String?
    
    public var username: String
    {
        set{_username = newValue}
        get{return _username}
    }
    public var password: String
    {
        set{_password = newValue}
        get{return _password}
    }
    

    public func getToken (completionHandler: @escaping CompletionHandler) {
        print("inside get token")
        cancellationToken = apiClient.getToken(username: _username, password: _password)
                    .mapError({ (error) -> Error in
                        print(error)
                        return error
                    })
                    .sink(receiveCompletion: { _ in },
                          receiveValue: {
                            print(" success and reponse is \($0)")
                            self.tokenResponse = $0
                            self.authorization = "\((self.tokenResponse?.tokenType)!) \((self.tokenResponse?.accessToken)!)"
                            print(" authorization is \(self.authorization!)")
                            completionHandler(true)
                    })
    }
    
    public func refreshToken () {
        print("inside refresh token")
        cancellationToken = apiClient.refreshToken(username: _username, refreshToken: (self.tokenResponse?.refreshToken)!)
                    .mapError({ (error) -> Error in
                        print(error)
                        return error
                    })
                    .sink(receiveCompletion: { _ in },
                          receiveValue: {
                            print(" success and reponse is \($0)")
                            self.tokenResponse = $0
                            self.authorization = "\((self.tokenResponse?.tokenType)!) \((self.tokenResponse?.accessToken)!)"
                            print(" authorization is \(self.authorization!)")
                    })
    }

    
    
}


