//
//  QuestionTitleTextView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/16/21.
//

import SwiftUI

struct QuestionTitleTextView: View {
    var title:String
    var styleModel: QuestionTitleStyleModel
    
    public var body: some View {
        let fontSize = CGFloat(Float((styleModel.fontSize!.deletingSuffix("px")))!)

        Text("Q\(HiveFramework.shared!.currentQuestionIndex+1). \(title)")
        .underline(styleModel.fontUnderline!)
        .italic(enabled: styleModel.fontItalic!)
        .font(.custom(styleModel.fontFamily!, size: fontSize))
            .foregroundColor(Color(hex: styleModel.fontColor!))
        .fontWeight(styleModel.fontBold! ? .bold : .none)
    }
}

struct QuestionTitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionTitleTextView(title: "title", styleModel: QuestionTitleStyleModel(fontBold: true, fontItalic: true, fontUnderline: true, fontFamily: "Arial", fontSize: "18px", fontColor: "000000"))
    }
}
