//
//  FirstViewController.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 09/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import UIKit
import MessageUI

class GGInformationViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailValueLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneValueLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke;
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width/2;
        self.profileImageView.layer.borderWidth = 10;
        self.profileImageView.layer.borderColor = UIColor.FlatColor.Green.PersianGreen.cgColor;
        
        self.nameLabel.text = NSLocalizedString("GG_INTRODUCEMENT_NAME", comment: "");
        self.phoneLabel.text = NSLocalizedString("GG_INTRODUCEMENT_PHONE_LABEL", comment: "");
        self.phoneValueLabel.text = NSLocalizedString("GG_INTRODUCEMENT_PHONE", comment: "");
        self.emailLabel.text = NSLocalizedString("GG_INTRODUCEMENT_EMAIL_LABEL", comment: "");
        self.emailValueLabel.text = NSLocalizedString("GG_INTRODUCEMENT_EMAIL", comment: "");
        self.addressLabel.text = NSLocalizedString("GG_INTRODUCEMENT_ADDRESS", comment: "");
        
        self.title = NSLocalizedString("GG_INTRODUCEMENT_TAB_LABEL", comment: "");
    }
    
    @IBAction func facebookTapped(_ sender: Any) {
        if UIApplication.shared.canOpenURL(URL(string: "fb://profile/LaloxMR")!) {
            UIApplication.shared.open(URL(string: "fb://profile/LaloxMR")!, options: [:])
        } else {
            UIApplication.shared.open(URL(string: "https://facebook.com/LaloxMR")!, options: [:])
        }
    }
    
    @IBAction func instagramTapped(_ sender: Any) {
        if UIApplication.shared.canOpenURL(URL(string: "instagram://user?username=laloxmr")!) {
            UIApplication.shared.open(URL(string: "instagram://user?username=laloxmr")!, options: [:])
        } else {
            UIApplication.shared.open(URL(string: "https://instagram.com/laloxmr")!, options: [:])
        }
    }
    
    @IBAction func twitterTapped(_ sender: Any) {
        if UIApplication.shared.canOpenURL(URL(string: "twitter://user?screen_name=Lalox_MR")!) {
            UIApplication.shared.open(URL(string: "twitter://user?screen_name=Lalox_MR")!, options: [:])
        } else {
            UIApplication.shared.open(URL(string: "https://twitter.com/Lalox_MR")!, options: [:])
        }
    }
    
    @IBAction func linkedInTapped(_ sender: Any) {
        if UIApplication.shared.canOpenURL(URL(string: "linkedin://#profile/eduardo-mr")!) {
            UIApplication.shared.open(URL(string: "linkedin://#profile/eduardo-mr")!, options: [:])
        } else {
            UIApplication.shared.open(URL(string: "https://www.linkedin.com/in/eduardo-mr")!, options: [:])
        }
    }
    
    @IBAction func skypeTapped(_ sender: Any) {
        if UIApplication.shared.canOpenURL(URL(string: "skype:laloxmr?chat")!) {
            UIApplication.shared.open(URL(string: "skype:laloxmr?chat")!, options: [:])
        } else {
            UIApplication.shared.open(URL(string: "itms-apps://itunes.apple.com/app/id304878510")!, options: [:])
        }
    }
    
    @IBAction func phoneTapped(_ sender: Any) {
        let url: NSURL = URL(string: "tel://5551446494")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func emailTapped(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["eduardo1618@gmail.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            present(mail, animated: true)
        }
    }
    
    @IBAction func smsTapped(_ sender: Any) {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.recipients = ["5551446494"]
            controller.messageComposeDelegate = self
            present(controller, animated: true)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

