//
//  ViewController.swift
//  TestTableView
//
//  Created by lidong on 2020/9/8.
//  Copyright © 2020 lidong. All rights reserved.
//

import UIKit

let CELL_ID = "custom_workout_list_cell_id"

/*
class ViewController: UIViewController {
    
    var myCollectionView: UICollectionView!
    var datasource =  [String]()
    var dragingIndexPath: IndexPath?
    
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        initData()
        initUI()
    }
}
//MARK: - data
extension ViewController {
    func initData() {
    datasource = [
        "111","222","333","444", "555","666","777","888","999"
    ]
    }
}
//MARK: - UI
extension ViewController {
    func initUI() {
        let flowLayout = UICollectionViewFlowLayout()
        //滚动方向
        flowLayout.scrollDirection = .vertical
        //网格中各行项目之间使用的最小间距
        flowLayout.minimumLineSpacing = 40
        //在同一行中的项目之间使用的最小间距
        flowLayout.minimumInteritemSpacing = 40
        //用于单元格的默认大小
        flowLayout.itemSize = CGSize(width: screenWidth, height: 60)

    
        myCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: CELL_ID)
        
        myCollectionView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        myCollectionView.backgroundColor = UIColor.white
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.dragDelegate = self
        myCollectionView.dropDelegate = self
        //示集合视图是否支持应用程序之间的拖放
        myCollectionView.dragInteractionEnabled = true
        view.addSubview(myCollectionView)
//        myCollectionView.snp.makeConstraints{ make in
//            make.width.height.equalToSuperview()
//            make.centerX.equalToSuperview()
//        }
    }
}
//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
    }
}
//MARK: - UICollectionViewDropDelegate
extension ViewController: UICollectionViewDropDelegate {
    ///处理拖动放下后如何处理
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        guard let destinationIndexPath = coordinator.destinationIndexPath else {
            return
        }
        switch coordinator.proposal.operation {
        case .move:
            let items = coordinator.items
            if let item = items.first, let sourceIndexPath = item.sourceIndexPath {
                //执行批量更新
                collectionView.performBatchUpdates({
                    
                    self.datasource.remove(at: sourceIndexPath.row)
                    self.datasource.insert(item.dragItem.localObject as! String, at: destinationIndexPath.row)
                    collectionView.deleteItems(at: [sourceIndexPath])
                    collectionView.insertItems(at: [destinationIndexPath])
                })
                //将项目动画化到视图层次结构中的任意位置
                coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
            }
            break
        case .copy:
            //执行批量更新
            collectionView.performBatchUpdates({
                var indexPaths = [IndexPath]()
                for (index, item) in coordinator.items.enumerated() {
                    let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                    self.datasource.insert(item.dragItem.localObject as! String, at:  indexPath.row)
                    indexPaths.append(indexPath)
                }
                collectionView.insertItems(at: indexPaths)
            })
            break
        default:
            return
        }
    }
    ///处理拖动过程中
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        guard dragingIndexPath?.section == destinationIndexPath?.section else {
            return UICollectionViewDropProposal(operation: .forbidden)
        }
        if session.localDragSession != nil {
            if collectionView.hasActiveDrag {
                return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
            } else {
                return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
            }
        } else {
            return UICollectionViewDropProposal(operation: .forbidden)
        }
    }
}
//MARK: - UICollectionViewDragDelegate
extension ViewController: UICollectionViewDragDelegate {
    ///处理首次拖动时，是否响应
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.datasource[indexPath.row]
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        dragingIndexPath = indexPath
        return [dragItem]
    }
}

//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    ///向您的数据源对象询问指定部分中的项目数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    ///向数据源对象询问集合视图中的部分数量。
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell:MyCollectionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! MyCollectionViewCell
         return cell
     }
    
    
}
*/

/*
class ViewController: UIViewController{
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
    var collectionView:UICollectionView?
    
    var datasource = [
        "111","222","333","444", "555","666","777","888","999"
    ]
    
    var dragingIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        initCollectionView()
    }
    
    func initCollectionView() {
        let defaultLayout = UICollectionViewFlowLayout()
        defaultLayout.scrollDirection = UICollectionView.ScrollDirection.vertical//设置垂直显示
        defaultLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)//设置边距
        defaultLayout.itemSize = CGSize(width: screenWidth, height: 60)
        defaultLayout.minimumLineSpacing = 40 //每个相邻的layout的上下间隔
        defaultLayout.minimumInteritemSpacing = 40 //每个相邻layout的左右间隔
        defaultLayout.headerReferenceSize = CGSize(width: 0, height: 0)
        defaultLayout.footerReferenceSize = CGSize(width: 0, height: 40)
        collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight), collectionViewLayout: defaultLayout)
        
        
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: CELL_ID)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.dragDelegate = self
        collectionView?.dropDelegate = self
        self.view.addSubview(collectionView!)
        
        collectionView?.dragInteractionEnabled = true
        
    }

}

//MARK: - UICollectionViewDropDelegate
extension ViewController: UICollectionViewDropDelegate {
    ///处理拖动放下后如何处理
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        guard let destinationIndexPath = coordinator.destinationIndexPath else {
            return
        }
        switch coordinator.proposal.operation {
        case .move:
            let items = coordinator.items
            if let item = items.first, let sourceIndexPath = item.sourceIndexPath {
                //执行批量更新
                collectionView.performBatchUpdates({

                    self.datasource.remove(at: sourceIndexPath.row)
                    self.datasource.insert(item.dragItem.localObject as! String, at: destinationIndexPath.row)

                    collectionView.deleteItems(at: [sourceIndexPath])
                    collectionView.insertItems(at: [destinationIndexPath])
                })
                //将项目动画化到视图层次结构中的任意位置
//                coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
            }
            break
        case .copy:
            //执行批量更新
//            collectionView.performBatchUpdates({
////                var indexPaths = [IndexPath]()
////                for (index, item) in coordinator.items.enumerated() {
////                    let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
////                    self.datasource.insert(item.dragItem.localObject as! String, at: indexPath.row)
////                    indexPaths.append(indexPath)
////                }
////                collectionView.insertItems(at: indexPaths)
//            })
            break
        default:
            return
        }
    }
    ///处理拖动过程中
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
//        guard dragingIndexPath?.section == destinationIndexPath?.section else {
//            return UICollectionViewDropProposal(operation: .forbidden)
//        }
        if session.localDragSession != nil {
            if collectionView.hasActiveDrag {
                return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
            } else {
                return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
            }
        } else {
            return UICollectionViewDropProposal(operation: .forbidden)
        }
    }
}

//MARK: - UICollectionViewDragDelegate
extension ViewController: UICollectionViewDragDelegate {
    ///处理首次拖动时，是否响应
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.datasource[indexPath.row]
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        dragingIndexPath = indexPath
        return [dragItem]
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ViewController: UICollectionViewDataSource {
    ///向您的数据源对象询问指定部分中的项目数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    ///向数据源对象询问集合视图中的部分数量。
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell:MyCollectionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! MyCollectionViewCell
         return cell
     }
}

*/



class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{//,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
//    var datasource = [
//        ["111"],["222"],["333"],["444"], ["555"],["666"],["777"],["888"],["999"]
//    ]
    
    var datasource = [
         "111","222","333","444", "555","666","777","888","999"
     ]
    
    struct My {
        static var cellSnapshot:UIView? = nil
        static var cellIsAniamting:Bool = false
        static var cellNeedToShow:Bool = false
    }
    
    struct Path {
        static var initialIndexPath : IndexPath? = nil
    }
    
    
    var collectionView:UICollectionView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        initCollectionView()
        
        let longGress = UILongPressGestureRecognizer()
        longGress.addTarget(self, action: #selector(longGressGestrue(longGress:)))
        self.collectionView!.addGestureRecognizer(longGress)
        
        self.collectionView?.dragInteractionEnabled = true

        for i in 0...datasource.count-1{
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
            label.text = "index \(i)"
            
            self.collectionView?.addSubview(label)

            label.sizeToFit()
            label.center = CGPoint(x: 100, y: 80+100*i)


            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            btn.setImage(createImage(imageName: "ic_creatworkout_adjust.png"), for: .normal)
            btn.addTarget(self, action: #selector(click), for: .touchUpInside)
            btn.sizeToFit()
            
            self.collectionView?.addSubview(btn)
            
            btn.center = CGPoint(x: label.center.x + 200, y: label.center.y)
        }
    }
    
    func createImage( imageName: String?) -> UIImage? {
         if imageName == nil {
             return UIImage()
         } else {
             let image = UIImage(named: imageName!)
             return image
         }
     }
    
    @objc func click(){
        print("click")
    }
    
    var startPoint = CGPoint(x: 0, y: 0)
    
    var targetCell:MyCollectionViewCell?
    
    
    
    @objc func longGressGestrue(longGress:UILongPressGestureRecognizer){
          if longGress.state == UIGestureRecognizer.State.began {
            let tPoint = longGress.location(in: self.collectionView!)
            let point = CGPoint(x: screenWidth/2, y: tPoint.y)
            startPoint = point
            guard let selectedIndexPath = self.collectionView!.indexPathForItem(at: point)  else {
                return
            }
            if let cell = self.collectionView!.cellForItem(at: selectedIndexPath) as? MyCollectionViewCell{
                let resPos = collectionView!.convert(tPoint, to: cell)
                print(resPos)
                if(!cell.handle!.frame.contains(resPos)){
                    return
                }
            }
            
            Path.initialIndexPath = selectedIndexPath
            
            collectionView?.beginInteractiveMovementForItem(at: selectedIndexPath)
            if let cell = collectionView?.cellForItem(at: selectedIndexPath) as? MyCollectionViewCell{
                
                My.cellSnapshot = snapshotOfCell(cell)
                My.cellSnapshot?.center = cell.center
                My.cellSnapshot?.alpha = 0
                
                self.collectionView?.addSubview(My.cellSnapshot!)
                
                UIView.animate(withDuration: 0.25, animations: {
                    My.cellIsAniamting = true
                    My.cellSnapshot!.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                    My.cellSnapshot!.alpha = 0.7
                    cell.alpha = 0
                    
                }) { (finished) in
                    if(finished){
                        My.cellIsAniamting = false
                        cell.isHidden = true
                    }
                }
                targetCell = cell
            }
          }else if longGress.state == UIGestureRecognizer.State.changed{
            var point = longGress.location(in: self.collectionView!)
            point = CGPoint(x: startPoint.x, y: point.y)
            collectionView?.updateInteractiveMovementTargetPosition(point)
            if(targetCell != nil){
                My.cellSnapshot?.center = targetCell!.center
            }
          }else if longGress.state == UIGestureRecognizer.State.ended{
            collectionView?.endInteractiveMovement()
            
            if(self.targetCell != nil){

                UIImageView.animate(withDuration: 0.25, animations: {
                    My.cellSnapshot?.center = self.targetCell!.center
                    My.cellSnapshot?.alpha = 0.1
                }) { (b) in
                    self.excuteEnd()
                }
                
            }
            
          }else{
            collectionView?.cancelInteractiveMovement()
          }
      }
      
    func excuteEnd(){
        self.targetCell!.isHidden = false
         self.targetCell!.alpha = 1.0
         My.cellSnapshot?.removeFromSuperview()
         
         My.cellSnapshot = nil
         self.targetCell = nil
    }
    
    
    func initCollectionView() {
        let defaultLayout = UICollectionViewFlowLayout()
        defaultLayout.scrollDirection = UICollectionView.ScrollDirection.vertical//设置垂直显示
        defaultLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)//设置边距
        defaultLayout.itemSize = CGSize(width: screenWidth, height: 60)
        defaultLayout.minimumLineSpacing = 40 //每个相邻的layout的上下间隔
        defaultLayout.minimumInteritemSpacing = 40 //每个相邻layout的左右间隔
        defaultLayout.headerReferenceSize = CGSize(width: 0, height: 0)
        defaultLayout.footerReferenceSize = CGSize(width: 0, height: 40)
        collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight), collectionViewLayout: defaultLayout)
         
     
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: CELL_ID)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        self.view.addSubview(collectionView!)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MyCollectionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! MyCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let resCell = self.collectionView?.cellForItem(at: indexPath)
        
        
        print(resCell?.superview)
         print("点击了第\(indexPath.section) 分区 ,第\(indexPath.row) 个元素")
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = self.datasource.remove(at: sourceIndexPath.item)
        self.datasource.insert(temp, at: destinationIndexPath.item)
    }

    func snapshotOfCell(_ inputView:UIView)->UIView{
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        let cellSnapshot : UIView = UIImageView(image: image)
        cellSnapshot.layer.masksToBounds = false
        cellSnapshot.layer.cornerRadius = 0.0
        cellSnapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 0.4
        return cellSnapshot
    }
    
}


