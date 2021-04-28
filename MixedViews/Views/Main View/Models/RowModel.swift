//
//  CellModel.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

public struct RowModel {
    
    let type: Any
    let model: Any?
    let destination: AnyView?
    
    init(type: Any, model: Any? = nil, destination: AnyView? = nil) {
        self.type = type
        self.model = model
        self.destination = destination
    }
}

public struct SectionModel: Identifiable {
    
    public var id = UUID().uuidString
    
    let headerModel: RowModel?
    let rowModels: [RowModel]?
    
    init(header: RowModel? = nil, rows: [RowModel]? = nil) {
        self.headerModel = header
        self.rowModels = rows
    }
}
