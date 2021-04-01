//
//  SurveyLogoStyleModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/10/21.
//

import Foundation
struct SurveyLogoStyleModel : Codable {
    let uRL : String?
    let sizePercentage : Int?
    let position : String?
    let actualWidth : Int?
    let opacity : Int?

    enum CodingKeys: String, CodingKey {

        case uRL = "URL"
        case sizePercentage = "SizePercentage"
        case position = "Position"
        case actualWidth = "ActualWidth"
        case opacity = "Opacity"
    }

}
