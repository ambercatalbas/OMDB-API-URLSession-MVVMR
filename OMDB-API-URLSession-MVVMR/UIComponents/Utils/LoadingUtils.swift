//
//  LoadingUtils.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 29.10.2023.
//

import UIKit

class LoadingUtils {
    static let shared = LoadingUtils()
    func visible(_ show: Bool = true, bgColor: UIColor = UIColor.black.withAlphaComponent(0.6)) {
        if show {
            DispatchQueue.main.async {
                LoadingOverlay.shared.showOverlay()
            }
        }else {
            DispatchQueue.main.async {
                LoadingOverlay.shared.hideOverlayView()
            }
        }
    }
}

public class LoadingOverlay{

    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()

    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay() {
        if  let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window {
            overlayView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            overlayView.center = CGPoint(x: window.frame.width / 2.0, y: window.frame.height / 2.0)
            overlayView.backgroundColor = .gray
            overlayView.clipsToBounds = true
            overlayView.layer.cornerRadius = 10

            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            activityIndicator.style = .whiteLarge
            activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)

            overlayView.addSubview(activityIndicator)
            window.addSubview(overlayView)

            activityIndicator.startAnimating()
        }
    }
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
