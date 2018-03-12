//
//  GGGalleryViewController.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 10/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import UIKit
import Lottie

class GGGalleryViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    
    private var empty: LOTAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke;
        self.title = NSLocalizedString("GG_GALLERY_TAB_LABEL", comment: "");
        
        self.messageLabel.textColor = UIColor.FlatColor.Red.TerraCotta
        self.messageLabel.text = NSLocalizedString("GG_GALLERY_NO_ITEMS", comment: "")
        
        let wink = LOTAnimationView(name: "empty_box")
        wink.frame = CGRect(x: 0, y: 0, width: 350, height: 500)
        wink.center = self.view.center
        wink.contentMode = .scaleAspectFill
        wink.animationSpeed = 0.8
        wink.loopAnimation = true
        view.addSubview(wink)
        wink.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
