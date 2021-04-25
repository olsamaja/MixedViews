//
//  BannersView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct BannersView: View {
    var body: some View {
        HStack() {
            BannerView(title: "Tap here!", subTitle: "Win a super prize")
            BannerView(title: "Great deals!", subTitle: "£50 discount")
        }
    }
}

public class BannersViewBuilder: BuilderProtocol {

    var models: [BannerModel]?

    public func withModels(_ models: [BannerModel]) -> BannersViewBuilder {
        self.models = models
        return self
    }

    @ViewBuilder
    public func build() -> some View {
        if let models = self.models {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(models, id: \.self) { model in
                        BannerView(title: model.title, subTitle: model.subTitle)
                    }
                }
            }
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            .listRowInsets(EdgeInsets())
        } else {
            EmptyView()
        }
    }
}

struct BannersView_Previews: PreviewProvider {
    static var previews: some View {
        BannersView()
            .sizeThatFitPreview(with: "Banners")
    }
}
