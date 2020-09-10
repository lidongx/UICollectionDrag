//
//  MyTableViewCell.swift
//  TestTableView
//
//  Created by lidong on 2020/9/8.
//  Copyright © 2020 lidong. All rights reserved.
//

import UIKit

typealias CellBlock = (_ longGress:UILongPressGestureRecognizer)->Void

class MyTableViewCell: UITableViewCell {

    var handle:UIImageView?
    var block:CellBlock?
    
    var offset = CGPoint(x: 0, y: 0)
    var orginPoint =  CGPoint(x: 0, y: 0)
    
    var startPoint = CGPoint(x: 0, y: 0)
    
    func setBlock(block:@escaping CellBlock){
        self.block = block
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .none
        selectionStyle = .none
        
        self.backgroundColor = .white
        
        if(nil == self.handle){
            handle = UIImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            handle?.image = createImage(imageName: "ic_creatworkout_adjust.png")
            contentView.addSubview(self.handle!)
            handle?.isUserInteractionEnabled = true
            
            let longGress = UILongPressGestureRecognizer()
            longGress.addTarget(self, action: #selector(longGressGestrue(longGress:)))
            handle?.addGestureRecognizer(longGress)
        }
        
    }
    
    
    
    @objc private func longGressGestrue(longGress:UILongPressGestureRecognizer){
        if longGress.state == UIGestureRecognizer.State.began {
            startPoint = longGress.location(in: self.superview!)
            orginPoint = self.center
            
            self.superview?.bringSubviewToFront(self)
            
        }else if longGress.state == UIGestureRecognizer.State.changed{
            print("changed")
            
            let newPoint = longGress.location(in: self.superview!)
            let deltaX =  newPoint.x-startPoint.x;
            let deltaY = newPoint.y-startPoint.y;
            
            self.center = CGPoint(x: self.center.x, y: self.center.y+deltaY)

            
            startPoint = newPoint
            
        }else if longGress.state == UIGestureRecognizer.State.ended{
            print("ended")
        }else{
            print("cancelled")
        }
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createImage( imageName: String?) -> UIImage? {
        if imageName == nil {
            return UIImage()
        } else {
            let image = UIImage(named: imageName!)
            return image
        }
    }

    func updateContext(){
        handle?.center = CGPoint(x: self.bounds.size.width - 50, y: self.bounds.size.height/2);
    }
    
}
