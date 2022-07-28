//
//  DisplayScale.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation
import UIKit

enum DisplayScale {
    static let height = UIScreen.main.bounds.height/DisplayScale.iphone13MiniHeight
    static let width = UIScreen.main.bounds.width/DisplayScale.iphone13MiniWidth
    static let iphone13MiniHeight: CGFloat = 812
    static let iphone13MiniWidth: CGFloat = 375
}
