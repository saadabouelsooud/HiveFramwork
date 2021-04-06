//
//  EmojiView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/15/21.
//

import SwiftUI


struct EmojiViewState {
    var emojiRatesList : [EmojiRateModel]
    var selectedNumberResponse: Int
    var selectedIndex: Int
    var title:String
    var titleStyle: QuestionTitleStyleModel
}

enum EmojiViewInput {
    case selectAnswer(index: Int)
}

struct EmojiView: View {
    @ObservedObject
    var viewModel : AnyViewModel<EmojiViewState,EmojiViewInput>
    @State var isHover = false

    
    init(selectedIndex: Int, title: String, titleStyle: QuestionTitleStyleModel) {
        self.viewModel = AnyViewModel(EmojiViewModel(selectedIndex: selectedIndex,title: title,titleStyle: titleStyle))
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 50)
            QuestionTitleTextView(title: viewModel.title, styleModel: viewModel.titleStyle)
            Spacer().frame(height: 70)
            VStack {
                HStack{
                    ForEach(0..<viewModel.emojiRatesList.count)
                    { index in
                        if #available(iOS 13.4, *)
                        {
                        EmojiShapeView(imageName: viewModel.emojiRatesList[index].imageName, selectedIndex: self.viewModel.selectedIndex,index: index)
                        .onTapGesture
                            {
                                self.select(index: index)
                            }
                        .scaleEffect(isHover ? 1.2 : 1)
                        .animation(.default)
                        .onHover { hover in
                                 isHover = hover
                                }
                        }
                    }
                }
            }
        }
        .padding()
        .frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: 300,
                        alignment: .topLeading
                )
    }
}

// MARK: - Private extension
private extension EmojiView {
    func select(index: Int) {
        viewModel.trigger(.selectAnswer(index: index))
    }
}



//struct EmojiView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmojiView(title: "title", titleStyle: QuestionTitleStyleModel(fontBold: true, fontItalic: true, fontUnderline: true, fontFamily: "Arial", fontSize: "18px", fontColor: "000000"))
//    }
//}
