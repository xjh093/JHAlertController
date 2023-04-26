//
//  JHAlertController.swift
//  JHAlertController
//
//  Created by HaoCold on 2023/4/26.
//

import UIKit

extension UIAlertController {
    convenience init(title: String?, image: String, imageSize: CGSize, preferredStyle:UIAlertController.Style) {
        let imageView = UIImageView(image: UIImage(named: image))
        self.init(title: title, contentView: imageView, viewSize: imageSize, preferredStyle: preferredStyle)
    }
    
    convenience init(title: String?, contentView: UIView, viewSize: CGSize, preferredStyle:UIAlertController.Style) {
        
        /*
         6p - scale: 3
         \n       - 31.67
         \n\n     - 47.67 (16)
         \n\n\n   - 63.67 (16)
         
         x - scale: 3
         \n       - 31.67
         \n\n     - 47.67 (16)
         \n\n\n   - 63.67 (16)
         
         xr - scale: 2
         \n       - 36
         \n\n     - 54 (18)
         \n\n\n   - 72 (18)
         */
        
        let scale = Int(UIScreen.main.scale)
        let lineHeight = scale == 2 ? 18 : 16
        let count = Int(ceilf(Float(viewSize.height / CGFloat(lineHeight))))
        
        var msg = ""
        for _ in 0..<count {
            msg += "\n"
        }
        
        self.init(title: title, message: msg, preferredStyle: preferredStyle)
        self.view.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: viewSize.width).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: viewSize.height).isActive = true
    }
}
