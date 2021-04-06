//
//  SurveyNavigationView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/18/21.
//

import SwiftUI

struct SurveyNavigationView: View {
    @ObservedObject var sdkState : HiveFramework
    let isPopup: Bool
    
    var body: some View {
        let leftArrowName = isPopup ? "popup-left" : "left"
        let rightArrowName = isPopup ? "popup-right" : "right"

        
        HStack
        {
            if(sdkState.questionsProgress != 0.0 && sdkState.currentQuestionIndex != 0)
            {
                 Button(action: {
                    sdkState.goLeft()
                 }, label: {
                    Image(leftArrowName , bundle: Bundle.module)/// module will be auto generated in runtime
                 })
            }
            
            Spacer()
            
            if(sdkState.questionsProgress != 100.0 )
            {
                Button(action: {
                    sdkState.goRight()
                }, label: {
                    Image(rightArrowName , bundle: Bundle.module) /// module will be auto generated in runtime
                })
            }
        }
    }
}

//struct SurveyNavigationView_Previews: PreviewProvider {
//    static var previews: some View {
//        SurveyNavigationView(sdkState: HiveFramework(username: "InAppUser", password: "InApp2021"))
//    }
//}
