////
////  BaseView.swift
////  HiveFramework
////
////  Created by Saad Abou elsoo'oud on 3/29/21.
////
//
//import SwiftUI
//
//public class SDKState: ObservableObject
//{
//    var tokenResponseWrapper = TokenResponseWrapper()
//    var surveyResponseWrapper = SurveyResponseWrapper()
//    var languageManager = LanguageManager.shared
//    var saveSurveyResponseWrapper = SaveSurveyResponseWrapper()
//    var questionsList: [QuestionModel] = []
//    var questionsViewlList: [AnyView] = []
//    var questionsViewModelList: [Any] = []
//    var questionResponses :[QuestionsResponse] = []
//    @Published var questionsProgress: CGFloat = 0.0
//    var currentQuestionIndex: CGFloat = 0.0
//}
//
//public enum SDKInput
//{
//    case fillData
//    case select
//    case submitAnswers
//}
//
//public struct BaseView: View {
//    @ObservedObject
//    var viewModel: AnyViewModel<SDKState, SDKInput>
//    
//    @State private var showCard = false
//    @State private var showPopup = false
//    @State private var CanShow = false
//    @State private var showError = false
//    var username: String
//    var password: String
//    
//    public init(username: String, password: String) {
//        self.username = username
//        self.password = password
//        self.viewModel = AnyViewModel(BaseViewModel(username: username, password: password))
//    }
//
//    public var body: some View {
//        
//        Button(action: {
//            self.viewModel.state.surveyResponseWrapper.getRelevantWebSurvey(language: "en", customerName: self.username, customerEmail: self.password, customerPhoneNumber: "01234567890", completionHandler:{ success in
//               // call fill lists
//                if(success)
//                {
//                  self.viewModel.trigger(.fillData)
//                  CanShow = true
//                }
//            })
//        }) {
//            Text("Get Survey")
//        }
//        
//        
//        if(CanShow)
//        {
//            Button(action: { self.showCard = true }) {
//                Text("Show Card")
//            }
//        
//            Button(action: { self.showPopup = true }) {
//                Text("Show Popub")
//            }
//        }
//        
//        if(showCard)
//        {
//            CardView(viewModel: AnyViewModel(CardViewModel(sdkState: self.viewModel.state)), progress: self.viewModel.state.questionsProgress)
//        }
//        if (showPopup)
//        {
////            PopupView(sdkState: <#T##HiveFramework#>)
//        }
//        
//    }
//
//}
//
////struct BaseView_Previews: PreviewProvider {
////    static var previews: some View {
////        BaseView()
////    }
////}
