//
//  GGAppsViewController.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 11/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import UIKit

class GGAppsViewController: UITableViewController {
    var apps: [[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke;
        if let path = Bundle.main.path(forResource: "applications", ofType: "plist") {
            apps = NSArray(contentsOfFile: path)! as! [[String : Any]]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let status = (apps[indexPath.item])["status"] as? Int
        let description = (apps[indexPath.item])["description"] as? String
        let alert = UIAlertController(title: NSLocalizedString("GG_DESCRIPTION_TITLE", comment: ""), message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("GG_ALERT_OK", comment: ""), style: .cancel, handler: nil))
        if (status == 2){
            self.present(alert, animated: true)
        }else {
            let webViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebViewControllerIdentifier") as? GGWebViewController
            let str = (apps[indexPath.item])["url"] as? String
            let url = URL(string: str!)
            webViewController?.url = url;
            self.navigationController?.pushViewController(webViewController!, animated: true)
            webViewController?.present(alert, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "GG_APP_CELL");
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "GG_APP_CELL");
        }
        cell?.accessoryType = UITableViewCellAccessoryType.checkmark;
        let name = (apps[indexPath.item])["name"] as? String
        cell?.textLabel?.text = name;
        let status = (apps[indexPath.item])["status"] as? Int
        if (status == 1) {
            cell?.detailTextLabel?.text = NSLocalizedString("GG_APP_PUBLISHED", comment: "");
            cell?.detailTextLabel?.textColor = UIColor.FlatColor.Green.ChateauGreen
        } else if (status == 2) {
            cell?.detailTextLabel?.text = NSLocalizedString("GG_APP_REMOVED", comment: "");
            cell?.detailTextLabel?.textColor = UIColor.FlatColor.Red.TerraCotta
        } else if (status == 3) {
            cell?.detailTextLabel?.text = NSLocalizedString("GG_APP_UPDATED", comment: "");
            cell?.detailTextLabel?.textColor = UIColor.FlatColor.Orange.NeonCarrot
        }
        return cell!;
    }
}
