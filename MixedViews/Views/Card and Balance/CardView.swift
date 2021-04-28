//
//  CardView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        HStack {
            Spacer()
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.red)
                .frame(width: 200, height: 150)
                .padding()
            Spacer()
        }
        .background(Color.white)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .sizeThatFitPreview(with: "Card")
    }
}
