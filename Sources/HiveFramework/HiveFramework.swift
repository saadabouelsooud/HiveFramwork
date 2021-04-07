import SwiftUI


public class HiveFramework:  ObservableObject {
    @Published var tokenResponseWrapper = TokenResponseWrapper()
    @Published var surveyResponseWrapper = SurveyResponseWrapper()
    @Published var saveSurveyResponseWrapper = SaveSurveyResponseWrapper()
    @Published var languageManager = LanguageManager.shared
    @Published var questionsProgress: CGFloat = 0.0
//    @Published var closeSurvey: Bool = false
    @Published var currentQuestionIndex: CGFloat = 0.0
    var questionsResponses: [QuestionsResponse] = []
    public var isGetTokenSuccess : Bool = false
    @Published public var isGetSurveySuccess : Bool = false
    @Published public var isSurveysaved : Bool = false
    @Published public var questionSelected : Bool = false


    public var isPopup : Bool = false


    static var shared: HiveFramework? // you should remove it after test cause it is ObservableObject

    
    public init(username: String, password: String) {
        tokenResponseWrapper = TokenResponseWrapper()
        tokenResponseWrapper.username = username
        tokenResponseWrapper.password = password
        tokenResponseWrapper.getToken { success in
            if(success)
            {
                self.surveyResponseWrapper = SurveyResponseWrapper()
                self.saveSurveyResponseWrapper = SaveSurveyResponseWrapper()
                self.surveyResponseWrapper.tokenResponseWrapper = self.tokenResponseWrapper
                self.saveSurveyResponseWrapper.tokenResponseWrapper = self.tokenResponseWrapper
                HiveFramework.shared = self
                self.isGetTokenSuccess = true
                self.getRelevantWebSurvey()
            }
        }
    }
    
    
    public func refreshToken()
    {
        tokenResponseWrapper.refreshToken()
    }
    
    public func setStrings(localizationStrings: [Placeholders : String])
    {
        languageManager.localizationStrings = localizationStrings
    }
    
    public func setLanguageDirection(languageDirection: ViewDirection)
    {
        languageManager.languageDireciton = languageDirection
    }
    
    public func getRelevantWebSurvey()
    {
        surveyResponseWrapper.getRelevantWebSurvey(language: "en", customerName: "saad", customerEmail: "ss@ss.com", customerPhoneNumber: "01234567890", completionHandler: {
            success in
            if(success)
            {
                self.isGetSurveySuccess = true
            }
        })
    }
    
    public struct HiveCardView: View {
        public init(){}
        public var body: some View{
            CardView(sdkState: HiveFramework.shared!)
        }
    }
    
    public struct HivePopupView: View
    {
        public init(){}
        public var body: some View{
            PopupView(sdkState: HiveFramework.shared!)
        }
    }
    
    public func getSurveyView() -> AnyView
    {
        let displayMode = self.surveyResponseWrapper.surveyResponse.survey?.surveyOptions?.displayMode
        if(displayMode == DisplayMode.CardView.rawValue && self.isGetSurveySuccess)
        {   
            return AnyView(HiveCardView())
        }
        else if(displayMode == DisplayMode.PopupView.rawValue && self.isGetSurveySuccess)
        {
            isPopup = true
            return AnyView(HivePopupView())
        }
        else
        {
            return AnyView(EmptyView())
        }
    }
}


struct QuestionsNavigationState {
    var questionsProgress: CGFloat
    var currentQuestionIndex: CGFloat

}

extension HiveFramework
{
    var questionsState: QuestionsNavigationState
    {
        get{
            QuestionsNavigationState(
            questionsProgress : self.questionsProgress,
            currentQuestionIndex : self.currentQuestionIndex)
          }
        set{
            self.questionsProgress = newValue.questionsProgress
            self.currentQuestionIndex = newValue.currentQuestionIndex
        }
    }
    
    func updateQuestionsProgress()
    {
        let questionsCount = (surveyResponseWrapper.surveyResponse.survey?.questions!.count)!
        let questionsFloatCount = CGFloat (questionsCount)
        questionsProgress = ((currentQuestionIndex + 1.0)/questionsFloatCount)*100
    }
    
    func goLeft()
    {
        let questionRequired = surveyResponseWrapper.surveyResponse.survey?.questions![Int(currentQuestionIndex)].isRequired
        
        if(currentQuestionIndex > 0 && (!questionRequired! && questionSelected))
        {
            currentQuestionIndex -= 1
            questionSelected = false
            updateQuestionsProgress()
        }
    }
    
    func goRight()
    {
        let questionRequired = surveyResponseWrapper.surveyResponse.survey?.questions![Int(currentQuestionIndex)].isRequired
        let questionsCount = (surveyResponseWrapper.surveyResponse.survey?.questions!.count)!
        let currentIndex = Int(currentQuestionIndex)
        if( currentIndex < questionsCount-1 && (!questionRequired! && questionSelected))
        {
            currentQuestionIndex += 1
            questionSelected = false
            updateQuestionsProgress()
        }
    }
    
}
