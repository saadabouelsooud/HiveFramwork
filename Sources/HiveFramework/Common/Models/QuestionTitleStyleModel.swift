//
//  QuestionTitleStyleModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/10/21.
//

import Foundation
struct QuestionTitleStyleModel : Codable {
    let fontBold : Bool?
    let fontItalic : Bool?
    let fontUnderline : Bool?
    let fontFamily : String?
    let fontSize : String?
    let fontColor : String?

    enum CodingKeys: String, CodingKey {

        case fontBold = "FontBold"
        case fontItalic = "FontItalic"
        case fontUnderline = "FontUnderline"
        case fontFamily = "FontFamily"
        case fontSize = "FontSize"
        case fontColor = "FontColor"
    }

}
