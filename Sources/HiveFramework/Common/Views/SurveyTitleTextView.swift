//
//  SurveyTitleTextView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/11/21.
//

import SwiftUI

public struct SurveyTitleTextView: View {
    var sdkState : HiveFramework
    
    
    public init (sdkState : HiveFramework)
    {
        self.sdkState = sdkState
    }
    
    public var body: some View {
        let styleModel: SurveyTitleStyleModel = (sdkState.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.theme?.surveyTitleStyle)!
        let title = (sdkState.surveyResponseWrapper.surveyResponse.survey?.title)!
        let fontSize = CGFloat(Float((styleModel.fontSize!.deletingSuffix("px")))!)

        Text(title)
        .underline(styleModel.fontUnderline!)
        .italic(enabled: styleModel.fontItalic!)
        .font(.custom(styleModel.fontFamily!, size: fontSize))
            .foregroundColor(Color(hex: styleModel.fontColor!))
        .fontWeight(styleModel.fontBold! ? .bold : .none)
    }
}

struct SurveyTitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyTitleTextView(
            sdkState: HiveFramework(username: "InAppUser", password: "InApp2021"))
    }
}
