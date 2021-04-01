//
//  EmojiShapeView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/15/21.
//

import SwiftUI

struct EmojiShapeView: View {
    var imageName: String
    var selectedIndex: Int
    var index: Int
    
    var body: some View {
        VStack{
            Image(imageName, bundle: Bundle.module) /// module will be auto generated in runtime
                .resizable()
                .frame(width: selectedIndex == index ? 60 : 40, height: selectedIndex == index ? 60 : 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            if(selectedIndex == index)
            {
                Image("line", bundle: Bundle.module) /// module will be auto generated in runtime
            }
        }
    }
}

//struct EmojiShapeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmojiShapeView(viewModel: EmojiViewModel(), imageName: "love", index: 0)
//    }
//}

