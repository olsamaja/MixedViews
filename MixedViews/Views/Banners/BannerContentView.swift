//
//  BannerContentView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct BannerContentView: View {
    
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(subTitle)
                .font(.footnote)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.blue, lineWidth: 2)
        )
    }
}

struct BannerContentView_Previews: PreviewProvider {
    static var previews: some View {
        BannerContentView(title: "Title", subTitle: "Sub title")
    }
}
