//
//  FirstViewController.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 09/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import UIKit

class GGInformationViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailValueLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneValueLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.FlatColor.Green.Fern;
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width/2;
        
        self.nameLabel.text = NSLocalizedString("GG_INTRODUCEMENT_NAME", comment: "");
        self.phoneLabel.text = NSLocalizedString("GG_INTRODUCEMENT_PHONE_LABEL", comment: "");
        self.phoneValueLabel.text = NSLocalizedString("GG_INTRODUCEMENT_PHONE", comment: "");
        self.emailLabel.text = NSLocalizedString("GG_INTRODUCEMENT_EMAIL_LABEL", comment: "");
        self.emailValueLabel.text = NSLocalizedString("GG_INTRODUCEMENT_EMAIL", comment: "");
        self.addressLabel.text = NSLocalizedString("GG_INTRODUCEMENT_ADDRESS", comment: "");
        
        self.title = NSLocalizedString("GG_INTRODUCEMENT_TAB_LABEL", comment: "");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

