//
//  EmojiRateModel.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/15/21.
//

import Foundation

struct EmojiRateModel: Identifiable {
    var id = UUID()
    var imageName: String
    var rateString: String
    var isSelected: Bool
    var numberResponse: Int

}
