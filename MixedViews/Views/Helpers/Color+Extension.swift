//
//  Color+Extension.swift
//  MixedViews
//
//  Created by Olivier Rigault on 24/04/2021.
//

import SwiftUI

extension Color {
    
    public static var defaultBackround: Color {
        return Color(UIColor.defaultBackround)
    }
}

extension UIColor {
    
    public static var defaultBackround: UIColor {
        return UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1.0)
    }
}
