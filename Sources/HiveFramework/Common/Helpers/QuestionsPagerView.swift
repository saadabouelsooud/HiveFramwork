//
//  QuestionsPagerView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/14/21.
//

import SwiftUI

public struct QuestionsPagerView<Content: View>: View {
    @ObservedObject var sdkState : HiveFramework
    let pageCount: Int
    let content: Content
    let isPopup: Bool

        @GestureState private var offsetX: CGFloat = 0

    init(isPopup: Bool, sdkState: HiveFramework,pageCount: Int, @ViewBuilder content: () -> Content) {
            self.pageCount = pageCount
            self.content = content()
            self.sdkState = sdkState
            self.isPopup = isPopup
        }

       public var body: some View {
        let surveyBackgroundColor = (sdkState.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.theme?.surveyBackgroundColor)!
//        let questionsNavigationState = Binding<QuestionsNavigationState>.init(.constant(self.sdkState.questionsState))!

        
        GeometryReader { geometry in
//            ZStack
//            {
                HStack(spacing: isPopup ? 10 : 5) {
                    self.content.frame(width: geometry.size.width)
                        .background(Color(hex: surveyBackgroundColor).opacity(isPopup ? 0.0: 0.1))
                        .cornerRadius(isPopup ? 0 : 25)
                }
                .cornerRadius(isPopup ? 0 : 25)
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: -CGFloat(sdkState.currentQuestionIndex) * geometry.size.width)
                .offset(x: self.offsetX)
                .highPriorityGesture(
                    DragGesture().updating(self.$offsetX) { value, state, _ in
                        state = value.translation.width
                    }
                    .onEnded({ (value) in
                        let offset = value.translation.width / geometry.size.width
                        let offsetPredicted = value.predictedEndTranslation.width / geometry.size.width
                        let newIndex = CGFloat(sdkState.currentQuestionIndex) - offset
                        
                        sdkState.currentQuestionIndex = newIndex
                        
                        withAnimation(.easeOut) {
                            if(offsetPredicted < -0.5 && offset > -0.5) {
                                sdkState.currentQuestionIndex = CGFloat(min(max(Int(newIndex.rounded() + 1), 0), self.pageCount - 1))
                            } else if (offsetPredicted > 0.5 && offset < 0.5) {
                                sdkState.currentQuestionIndex = CGFloat(min(max(Int(newIndex.rounded() - 1), 0), self.pageCount - 1))
                            } else {
                                sdkState.currentQuestionIndex = CGFloat(min(max(Int(newIndex.rounded()), 0), self.pageCount - 1))
                            }
                        }
                        sdkState.updateQuestionsProgress()
                    })
                )/// end of pager
                
//                if(isPopup)
//                {
//                    SurveyNavigationView(sdkState: HiveFramework.shared!, navStatus: questionsNavigationState, isPopup: true)
//                }
//              } /// end of ZStack
            }
        } /// end of view

}

struct QuestionsPagerView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsPagerView(isPopup: true, sdkState: HiveFramework(username: "String", password: "String"), pageCount: 3, content:
            {
                Text("hi from page number")
                Text("hi again")
                Text("hi three")
            }
        )
    }
}
