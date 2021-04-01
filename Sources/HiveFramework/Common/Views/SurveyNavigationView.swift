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
        
        HStack
        {
            if(sdkState.questionsProgress != 0.0 )
            {
                 Button(action: {
                    sdkState.goLeft()
                 }, label: {
                    Image(isPopup ? "popup-left" : "left", bundle: Bundle.module)/// module will be auto generated in runtime
                 })
            }
            
            Spacer()
            
            if(sdkState.questionsProgress != 100.0 )
            {
                Button(action: {
                    sdkState.goRight()
                }, label: {
                    Image(isPopup ? "popup-right" : "right" , bundle: Bundle.module) /// module will be auto generated in runtime
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
