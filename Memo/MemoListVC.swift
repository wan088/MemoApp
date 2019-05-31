//
//  MemoListVC.swift
//  Memo
//
//  Created by Yongwan on 31/05/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {
    var dele = UIApplication.shared.delegate as! AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = dele.memoList.count
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let md = dele.memoList[indexPath.row]
        let id = md.image == nil ? "memoCell" : "memoCellWithImage"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as! MemoCell
        
        let dt = DateFormatter()
        dt.dateFormat = "yy:MM:dd HH:mm:ss"
        
        cell.regDate.text = dt.string(from: (md.regdate)!)
        cell.contents.text = md.contents
        if(id == "memoCellWithImage"){
            cell.img.image = md.image
        }
        cell.title.text = md.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //read_sg
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as! MemoReadVC
        vc.row = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    


}
