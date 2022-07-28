//
//  Font.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit

enum AppFont {
    case sfProBold15
    case sfProBold24
    case sfProMedium17
    case sfProHeavy47
    case sfProHeavy17
    case sfProBold17
    case sfProRegular17
    case sfProBold12
    case sfProBold29
    case sfProRegular15
    case sfProBold48
    case sfProMedium15
    case sfProBold26
    case sfProBold13
    
    private var displayCF: CGFloat {
        switch UIScreen.main.bounds.width {
        case 413...500:
            return 0
        case 380...412:
            return 1
        case 359...379:
            return 2
        default:
            return 3
        }
    }
    
    var font: UIFont? {
        switch self {
        case .sfProBold15:
            return UIFont(name: "SFProDisplay-Bold", size: (17 - self.displayCF))
        case .sfProBold24:
            return UIFont(name: "SFProDisplay-Bold", size: 26 - self.displayCF)
        case .sfProMedium17:
            return UIFont(name: "SFProDisplay-Medium", size: 19 - self.displayCF)
        case .sfProHeavy47:
            return UIFont(name: "SFProDisplay-Heavy", size: 49 - self.displayCF)
        case .sfProHeavy17:
            return UIFont(name: "SFProDisplay-Heavy", size: 19 - self.displayCF)
        case .sfProBold17:
            return UIFont(name: "SFProDisplay-Bold", size: 19 - self.displayCF)
        case .sfProRegular17:
            return UIFont(name: "SFProDisplay-Regular", size: 19 - self.displayCF)
        case .sfProBold12:
            return UIFont(name: "SFProDisplay-Bold", size: 14 - self.displayCF)
        case .sfProBold29:
            return UIFont(name: "SFProDisplay-Bold", size: 31 - self.displayCF)
        case .sfProRegular15:
            return UIFont(name: "SFProDisplay-Regular", size: 17 - self.displayCF)
        case .sfProBold48:
            return UIFont(name: "SFProDisplay-Bold", size: 50 - self.displayCF)
        case .sfProMedium15:
            return UIFont(name: "SFProDisplay-Medium", size: 17 - self.displayCF)
        case .sfProBold26:
            return UIFont(name: "SFProDisplay-Bold", size: 28 - self.displayCF)
        case .sfProBold13:
            return UIFont(name: "SFProDisplay-Bold", size: 15 - self.displayCF)
        }
    }
}



