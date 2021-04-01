//
//  SubmitButtonModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/10/21.
//

import Foundation
struct SubmitButtonModel : Codable {
    let fontFamily : String?
    let fontColor : String?
    let backgroundColor : String?
    let hoverFontColor : String?
    let hoverBackground : String?
    let borderColor : String?
    let fontBold : Bool?
    let fontItalic : Bool?
    let fontUnderline : Bool?
    let fontSize : String?

    enum CodingKeys: String, CodingKey {

        case fontFamily = "FontFamily"
        case fontColor = "FontColor"
        case backgroundColor = "BackgroundColor"
        case hoverFontColor = "HoverFontColor"
        case hoverBackground = "HoverBackground"
        case borderColor = "BorderColor"
        case fontBold = "FontBold"
        case fontItalic = "FontItalic"
        case fontUnderline = "FontUnderline"
        case fontSize = "FontSize"
    }

}
