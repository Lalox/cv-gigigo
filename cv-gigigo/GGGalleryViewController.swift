//
//  GGGalleryViewController.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 10/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import UIKit

class GGGalleryViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.FlatColor.Orange.NeonCarrot;
        self.title = NSLocalizedString("GG_GALLERY_TAB_LABEL", comment: "");
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GG_GALLERY_CELL", for: indexPath)  ;
        return cell;
    }
}
