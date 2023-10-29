//
//  UIImageView+Extensions.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import UIKit

public extension UIImageView {
    
    func setImage(_ string: String?, placeholder: UIImage? = nil) {
        guard let string = string else {
            return
        }
        
        ImageProvider.shared.fetchImage(imgeURL: string) { image in
            guard image != nil else {
                DispatchQueue.main.async {
                    self.image = placeholder
                }
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    
}
