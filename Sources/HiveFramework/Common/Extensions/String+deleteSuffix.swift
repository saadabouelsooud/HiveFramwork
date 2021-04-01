//
//  String+deleteSuffix.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/11/21.
//

import Foundation
extension String {
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
}
