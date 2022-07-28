//
//  Color.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit

enum Color {
    case light
    case red
    case gray
    case black
    case darkGray
    case textGray
    case grayDisable
    case blueGreen
    case violet
    case blue
    case purple
    
    var color: UIColor {
        switch self {
        case .light:
            return UIColor(red: 247/255, green: 249/255, blue: 252/255, alpha: 1)
        case .red:
            return UIColor(red: 255/255, green: 95/255, blue: 114/255, alpha: 1)
        case .gray:
            return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        case .black:
            return UIColor(red: 32/255, green: 34/255, blue: 40/255, alpha: 1)
        case .darkGray:
            return UIColor(red: 70/255, green: 72/255, blue: 76/255, alpha: 1)
        case .textGray:
            return UIColor(red: 192/255, green: 194/255, blue: 202/255, alpha: 1)
        case .grayDisable:
            return UIColor(red: 171/255, green: 172/255, blue: 175/255, alpha: 1)
        case .blueGreen:
            return UIColor(red: 6/255, green: 189/255, blue: 189/255, alpha: 1)
        case .violet:
            return UIColor(red: 149/255, green: 38/255, blue: 201/255, alpha: 1)
        case .blue:
            return UIColor(red: 59/255, green: 84/255, blue: 216/255, alpha: 1)
        case .purple:
            return UIColor(red: 184/255, green: 59/255, blue: 216/255, alpha: 1)
        }
    }
}
