//
//  CircleNumber.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/15/21.
//

import SwiftUI

struct CircleNumber: View {
    var selectedIndex: Int
    var index: Int


    var numberText: String
    var circleHexColor: String
    
    var body: some View {
        ZStack{
            Circle().foregroundColor(Color(hex: circleHexColor))
                .frame(width: selectedIndex == index ? 32 : 24, height: selectedIndex == index ? 32 : 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(numberText)
                .foregroundColor(.white)
        }
    }
}

//struct CircleNumber_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleNumber(viewModel: CircleNPSViewModel(), index: 0, numberText: "1",circleHexColor:"e43e3d")
//    }
//}
