//
//  LanguageManager.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/9/21.
//

import Foundation

public enum ViewDirection {
  case fixed, leftToRight, rightToLeft
}

public class LanguageManager{
    
      /// The diriction of the language.
   public var isRightToLeft: Bool {
        get {
            return _languageDireciton == ViewDirection.rightToLeft
        }
      }
    
    private var _localizationStrings: [Placeholders : String]?
    var localizationStrings: [Placeholders : String]
    {
        set{ _localizationStrings = newValue}
        get{return _localizationStrings!}
    }
    
    
    private var _languageDireciton: ViewDirection?
    var languageDireciton: ViewDirection
    {
        set{ _languageDireciton = newValue}
        get{return _languageDireciton!}
    }
    
    private init(){}
    public static let shared: LanguageManager = LanguageManager()
}
