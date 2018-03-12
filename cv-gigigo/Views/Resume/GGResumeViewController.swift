//
//  SecondViewController.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 09/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import UIKit
import UserNotifications

class GGResumeViewController: UITableViewController {
    var messages: [Messages] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke;
        self.title = NSLocalizedString("GG_RESUME_TAB_LABEL", comment: "");
        
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped));
    }

    @objc func addTapped() {
        let alert = UIAlertController(title: NSLocalizedString("GG_ALERT_TITLE", comment: ""), message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("GG_ALERT_CANCEL", comment: ""), style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = NSLocalizedString("GG_ALERT_PLACEHOLDER", comment: "")
        })
        alert.addAction(UIAlertAction(title: NSLocalizedString("GG_ALERT_SAVE", comment: ""), style: .default, handler: { action in
            if let message = alert.textFields?.first?.text {
                GGStorageManager.createMessage(content: message)
                self.tableView.reloadData();
            }
        }))
        self.present(alert, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 4;
        } else {
            return messages.count;
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return NSLocalizedString("GG_FIRST_SECTION_TITLE", comment: "");
        } else {
            messages = GGStorageManager.sharedInstance.getMessages() as! [Messages];
            if (messages.count == 0) {
                return "";
            }
            return NSLocalizedString("GG_SECOND_SECTION_TITLE", comment: "");
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        if (indexPath.section == 0) {
            if (indexPath.item == 0){
                let mapViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "MapViewControllerIdentifier") as? GGMapViewController
                self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
            } else if (indexPath.item == 1){
                let mapViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "AppsViewControllerIdentifier") as? GGAppsViewController
                self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
            } else if (indexPath.item == 2){
                let alert = UIAlertController(title: "", message: NSLocalizedString("GG_LOCAL_NOTIFICATION_MESSAGE", comment: ""), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("GG_ALERT_OK", comment: ""), style: .cancel, handler: nil))
                self.present(alert, animated: true)
                
                let content = UNMutableNotificationContent()
                content.title = "Hola Mundo!"
                content.body = "Notificación local"
                content.sound = UNNotificationSound.default()
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
                let request = UNNotificationRequest(identifier: "TestIdentifier", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            } else if (indexPath.item == 3) {
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "QRScannerViewControllerIdentifier")
                self.navigationController?.pushViewController(controller!, animated: true)
            }
        } else {
            let alert = UIAlertController(title: NSLocalizedString("GG_ALERT_TITLE", comment: ""), message: messages[indexPath.item].content, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("GG_ALERT_OK", comment: ""), style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "GG_RESUME_CELL");
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "GG_RESUME_CELL");
        }
        if (indexPath.section == 0) {
            switch indexPath.item {
            case 0:
                cell?.textLabel?.text = NSLocalizedString("GG_FTIST_SECTION_ITEM_1", comment: "");
            case 1:
                cell?.textLabel?.text = NSLocalizedString("GG_FTIST_SECTION_ITEM_2", comment: "");
            case 2:
                cell?.textLabel?.text = NSLocalizedString("GG_FTIST_SECTION_ITEM_3", comment: "");
            case 3:
                cell?.textLabel?.text = NSLocalizedString("GG_FTIST_SECTION_ITEM_4", comment: "");
            default:
                cell?.textLabel?.text = "";
            }
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator;
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark;
            cell?.textLabel?.text = DateFormatter.localizedString(from: messages[indexPath.item].date!, dateStyle: DateFormatter.Style.short , timeStyle: DateFormatter.Style.short);
            cell?.detailTextLabel?.text = messages[indexPath.item].content;
        }
        return cell!;
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if (indexPath.section == 1){
            return true;
        } else {
            return false;
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            GGStorageManager.deleteMessage(item: messages[indexPath.row]);
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
        }
    }
}

