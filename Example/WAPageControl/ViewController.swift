//
//  ViewController.swift
//  WAPageControl
//
//  Created by EDS on 27/11/2021.
//

import UIKit
import WAPageControl

class ViewController: UIViewController {

    internal let numberOfPages = 4
    @IBOutlet var pageControls: [WABasePageControl]!
    @IBOutlet var coloredPageControls: [WABasePageControl]!
    @IBOutlet weak var verticalPageControl: WAPageControlJalapeno!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageControls.forEach { (control) in
            control.numberOfPages = self.numberOfPages
        }
        
        // You can insert tint colors to a position (it will replace that position with the selected color)
        coloredPageControls.forEach { (control) in
            control.insertTintColor(randomColor(), position: Int(arc4random_uniform(UInt32(numberOfPages))))
            control.insertTintColor(randomColor(), position: Int(arc4random_uniform(UInt32(numberOfPages))))
        }
        
        // You can also initialize the tintColors with an array
        coloredPageControls.last?.tintColors = [randomColor(), randomColor(), randomColor(), randomColor()]

        //you can display page control vertical
        self.verticalPageControl.transform = self.pageControls.last!.transform.rotated(by: .pi/2)
        
        //you can activate touch through code
        self.verticalPageControl.enableTouchEvents = true
        self.verticalPageControl.delegate = self
        
        self.coloredPageControls.forEach({ pager in
            pager.delegate = self
        })
    }

    func randomColor() -> UIColor{
        return UIColor(red: CGFloat(drand48()),
                       green: CGFloat(drand48()),
                       blue: CGFloat(drand48()),
                       alpha: 1.0)
        
    }
}

extension ViewController: WABasePageControlDelegate {
    func didTouch(pager: WABasePageControl, index: Int) {
        print(pager, index)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "aCell", for: indexPath)
        cell.backgroundColor = self.randomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let total = scrollView.contentSize.width - scrollView.bounds.width
        let offset = scrollView.contentOffset.x
        let percent = Double(offset / total)
        
        let progress = percent * Double(self.numberOfPages - 1)
        
        (self.pageControls + self.coloredPageControls).forEach { (control) in
            control.progress = progress
        }
    }
}

