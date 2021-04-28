//
//  BannersView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct BannersView: View {
    
    let models: [BannerModel]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 10) {
                ForEach(models, id: \.self) { model in
                    BannerView(title: model.title, subTitle: model.subTitle)
                }
            }
        }
        .padding()
        .background(Color.white)
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
            BannersView(models: models)
        } else {
            EmptyView()
        }
    }
}

struct BannersView_Previews: PreviewProvider {
    static var previews: some View {
        BannersViewBuilder()
            .withModels([
                BannerModel(title: "Title 1", subTitle: "Subtile 1"),
                BannerModel(title: "Title 2", subTitle: "Subtile 2")
            ])
            .build()
            .sizeThatFitPreview(with: "Banners")
    }
}
