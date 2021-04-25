//
//  BannerView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct BannerView: View {
    
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

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(title: "Title", subTitle: "Sub title")
            .sizeThatFitPreview(with: "Banner")
    }
}

public struct BannerModel: Hashable {
    let title: String
    let subTitle: String
}
