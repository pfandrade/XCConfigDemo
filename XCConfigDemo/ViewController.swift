//
//  ViewController.swift
//  XCConfigDemo
//
//  Created by Paulo Andrade on 06/04/2018.
//  Copyright © 2018 Paulo Andrade. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var rows: [(key: String, value: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        rows.append(("Release Name", BuildConfig.current.releaseName))
        rows.append(("API Token", BuildConfig.current.apiToken))
#if BETA
        rows.append(("Feedback Email", "email@example.com"))
#endif
        rows.append(("Automatically Send Crash Reports", BuildConfig.current.automaticallySendCrashReports ? "Yes" : "No"))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "SettingCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "SettingCell")
        }
        let row = rows[indexPath.row]
        cell.detailTextLabel?.text = row.key
        cell.textLabel?.text = row.value
        return cell
    }
}

