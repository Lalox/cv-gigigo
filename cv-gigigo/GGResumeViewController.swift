//
//  SecondViewController.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 09/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import UIKit

class GGResumeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.FlatColor.Blue.Denim;
        self.title = NSLocalizedString("GG_RESUME_TAB_LABEL", comment: "");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "GG_RESUME_CELL");
        if (cell == nil){
            cell = UITableViewCell();
        }
        cell?.textLabel?.text = "Hola mundo";
        return cell!;
    }
}

