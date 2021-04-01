//
//  SurveyOptionsModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/10/21.
//

import Foundation
struct SurveyOptionsModel : Codable {
    let displayMode : Int?
    let hasProgressBar : Bool?
    let progressBarPosition : Int?
    let theme : ThemeModel?

    enum CodingKeys: String, CodingKey {

        case displayMode = "DisplayMode"
        case hasProgressBar = "HasProgressBar"
        case progressBarPosition = "ProgressBarPosition"
        case theme = "Theme"
    }

}
