//
//  GetTokenResponseModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/7/21.
//

import Foundation

public struct TokenResponseModel: Codable {
    public let accessToken: String?
    public let tokenType: String?
    public let expiresIn: Int?
    public let refreshToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"

    }
}
