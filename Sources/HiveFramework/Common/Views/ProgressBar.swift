//
//  ProgressBar.swift
//  HiveFramework
//
//  Created by Saad Abou elsoo'oud on 3/11/21.
//

import SwiftUI

struct ProgressBar: View {
    @State var isShowing = false
    @Binding var progress: CGFloat

        var body: some View {
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray)
                    .opacity(0.3)
                    .frame(width: 345.0, height: 8.0)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: self.isShowing ? 345.0 * (self.progress / 100.0) : 0.0, height: 8.0)
                    .animation(.linear(duration: 0.6))
            }
            .onAppear {
                self.isShowing = true
            }
            .cornerRadius(4.0)
        }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: .constant(80.0))
    }
}
