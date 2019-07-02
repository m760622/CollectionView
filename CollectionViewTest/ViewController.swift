//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Vijendra  on 02/07/19.
//  Copyright © 2019 Vijendra . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var testCollectionView: UICollectionView!
    
    let rowsCount = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testCollectionView.delegate = self
        testCollectionView.dataSource = self
        loadCell()
        testCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVCell", for: indexPath) as! CustomCVCell
        
        cell.backgroundColor = UIColor.yellow
        
//        cell.thirdView.alpha = 0
//        cell.rightSeperator.alpha = 0
//
        
//        if rowsCount.count/2 == 0  {
//            cell.thirdView.alpha = 0
//            cell.rightSeperator.alpha = 0
//        }
//        cell.fristView.isHidden = true
        if rowsCount == indexPath.row {
//            cell.fristView.isHidden = true
//            cell.rightSeperator.alpha = 0
        } else {
//            cell.fristView.isHidden = false
            
//            cell.thirdView.alpha = 1
//            cell.rightSeperator.alpha = 1
        }
        return cell
    }
    
    private func loadCell() {

        let lastIndexPath = IndexPath(item: rowsCount, section: 1)
        let secondLastIndexPath = IndexPath(item: rowsCount-1, section: 1)

        let cell1 = testCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVCell", for: lastIndexPath) as? CustomCVCell
        let cell2 = testCollectionView.cellForItem(at: secondLastIndexPath) as? CustomCVCell

        cell1?.secondView.isHidden = true
        cell2?.secondView.isHidden = true

        testCollectionView.reloadData()

//        if rowsCount == 0 {
//            cell1?.thirdView.alpha = 0
//            cell2?.thirdView.alpha = 0
//        } else {
//            cell1?.thirdView.alpha = 0
//        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: 150)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
//    }
}
