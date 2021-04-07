//
//  SurveyTitleView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/11/21.
//

import SwiftUI

struct SurveyTitleView: View {
    @ObservedObject  var sdkState : HiveFramework
    
    var body: some View {
        let surveyBackgroundColor = (HiveFramework.shared!.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.theme?.surveyBackgroundColor)!
        let surveyHasProgress = (HiveFramework.shared!.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.hasProgressBar)!

        VStack(alignment: .leading){
            
            Text("hiiiiiiiii")
            Button(action: {
                HiveFramework.shared!.closeSurvey = true
            }, label : {
              Image("close" , bundle: Bundle.module) /// module will be auto generated in runtime
            })
            
            HStack() {

                SurveyTitleTextView(sdkState: HiveFramework.shared!)


                Spacer()
                
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 25.0, height: 25.0)

            }
            .padding(10)
            
            if(surveyHasProgress)
            {
            ProgressBar(progress: $sdkState.questionsProgress)
            .padding(10)
            }
        }
        .padding(10)
        .environment(\.layoutDirection, LanguageManager.shared.isRightToLeft ? .rightToLeft : .leftToRight)
        .background(Color(hex: surveyBackgroundColor).opacity(0.1))
        
    }
}

//struct SurveyTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        SurveyTitleView()
//    }
//}
