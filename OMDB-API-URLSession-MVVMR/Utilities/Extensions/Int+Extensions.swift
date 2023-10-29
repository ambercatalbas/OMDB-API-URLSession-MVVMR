//
//  Int+Extensions.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import UIKit

extension Int {
    var scaled: CGFloat {
        return (CGFloat(self * 414) / UIScreen.main.bounds.width)
    }
    
    var scaledH: CGFloat {
        return (CGFloat(self) * UIScreen.main.bounds.height) / 812
    }
    
    var scaledV: CGFloat {
        return (CGFloat(self) * UIScreen.main.bounds.width) / 375
    }
    
    func toString() -> String {
        return String(self)
    }
}
