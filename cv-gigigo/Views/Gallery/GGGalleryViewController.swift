//
//  GGGalleryViewController.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 10/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import UIKit
import Lottie

class GGGalleryViewController: UICollectionViewController {
    
    private var empty: LOTAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke;
        self.title = NSLocalizedString("GG_GALLERY_TAB_LABEL", comment: "");
        
        let wink = LOTAnimationView(name: "empty_box")
        wink.frame = CGRect(x: 0, y: 0, width: 350, height: 500)
        wink.center = self.view.center
        wink.contentMode = .scaleAspectFill
        wink.animationSpeed = 0.8
        wink.loopAnimation = true
        view.addSubview(wink)
        wink.play()
        
        self.collectionView?.isHidden = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0;
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0;
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GG_GALLERY_CELL", for: indexPath)  ;
        return cell;
    }
}
