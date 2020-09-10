//
//  MyCollectionViewCollectionViewCell.swift
//  TestTableView
//
//  Created by lidong on 2020/9/8.
//  Copyright © 2020 lidong. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
 
    var handle:UIImageView?
    var imageView:UIImageView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        if(nil == imageView){
            imageView = UIImageView(frame: .zero)
            imageView?.image = createImage(imageName: "111.png")
            contentView.addSubview(self.imageView!)
            imageView?.sizeToFit()
            imageView?.isUserInteractionEnabled = true
            imageView?.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        }
        
        if(nil == self.handle){
            handle = UIImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            handle?.image = createImage(imageName: "ic_creatworkout_adjust.png")
            contentView.addSubview(self.handle!)
            
            handle?.isUserInteractionEnabled = true
        }
        
        handle?.center = CGPoint(x: self.bounds.width - 50, y: self.bounds.size.height/2)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addShadow(){
//        
//        self.alpha = 0.1
//
//        imageView?.alpha = 0.1
        
        
//        let layer = self.layer
//        layer.shadowOffset = CGSize(width: 0, height: 2)
//        layer.shadowRadius = 1.0
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.5
//        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    
    func createImage( imageName: String?) -> UIImage? {
        if imageName == nil {
            return UIImage()
        } else {
            let image = UIImage(named: imageName!)
            return image
        }
    }
}
