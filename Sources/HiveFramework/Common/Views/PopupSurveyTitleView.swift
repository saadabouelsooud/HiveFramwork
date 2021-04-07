//
//  PopupSurveyTitleView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/23/21.
//

import SwiftUI

struct PopupSurveyTitleView: View {
    @ObservedObject  var sdkState : HiveFramework

    var body: some View {
        let surveyHasProgress = (HiveFramework.shared!.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.hasProgressBar)!
        
        VStack(alignment: .leading)
        {
            Button(action: {
                HiveFramework.shared!.closeSurvey = true
            }, label : {
              Image("close" , bundle: Bundle.module) /// module will be auto generated in runtime
            })
            
            HStack()
            {
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
    }
}

struct PopupSurveyTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PopupSurveyTitleView(sdkState: HiveFramework.shared!)
    }
}
