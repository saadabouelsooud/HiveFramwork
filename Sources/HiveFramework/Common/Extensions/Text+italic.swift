//
//  Text+italic.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/11/21.
//

import Foundation
import SwiftUI
extension Text {
    func italic(enabled: Bool) -> Text {
        if (enabled) {
            return self.italic()
        }
        return self
    }
}
