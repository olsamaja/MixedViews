//
//  BuilderProtocol.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import Foundation

public protocol BuilderProtocol {
    
    associatedtype T
    
    func build() -> T
}
