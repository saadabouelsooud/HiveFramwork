//
//  NPSView.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/15/21.
//

import SwiftUI

struct NPSViewState {
    var npsRatesList : [NumberedCircle]
    var selectedNumberResponse: Int
    var selectedIndex: Int
    var title:String
    var titleStyle: QuestionTitleStyleModel
}

enum NPSViewInput {
    case selectNPSAnswer(index: Int)
}

struct NPSView: View {
    @ObservedObject
    var viewModel : AnyViewModel<NPSViewState,NPSViewInput>
    
    init(selectedIndex: Int, title: String, titleStyle: QuestionTitleStyleModel) {
        self.viewModel = AnyViewModel(NPSViewModel(selectedIndex: selectedIndex, title: title, titleStyle: titleStyle))
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            QuestionTitleTextView(title: viewModel.title, styleModel: viewModel.titleStyle)
            Spacer().frame(height: 50)
            VStack {
                    HStack{
                        ForEach(0..<self.viewModel.npsRatesList.count)
                        { index in
                            CircleNumber(selectedIndex: self.viewModel.selectedIndex, index: index, numberText: String(self.viewModel.npsRatesList[index].numberResponse), circleHexColor: self.viewModel.npsRatesList[index].circleHexColor)
                            .onTapGesture
                                {
                                    self.select(index: index)
                                }
                        }
                    }
                HStack()
                {
                    Text("Bad")
                        .foregroundColor(Color(hex: "e43e3d"))
                    Spacer()
                    Text("Good")
                        .foregroundColor(Color(hex: "f8c43e"))
                    Spacer()
                    Text("Great")
                        .foregroundColor(Color(hex: "5aaf2b"))

                }
                .padding()
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
private extension NPSView {
    func select(index: Int) {
        HiveFramework.shared!.questionSelected = true
        viewModel.trigger(.selectNPSAnswer(index: index))
    }
}



//struct NPSView_Previews: PreviewProvider {
//    static var previews: some View {
//        NPSView(title: "title", titleStyle: QuestionTitleStyleModel(fontBold: true, fontItalic: true, fontUnderline: true, fontFamily: "Arial", fontSize: "18px", fontColor: "000000"))
//    }
//}
