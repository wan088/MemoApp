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
    var uManager = UserInfoManager()
    override func viewWillAppear(_ animated: Bool) {
        if !UserDefaults.standard.bool(forKey: UserInfoManager.UserInfoKey.tutorial) {
            var tutoStory = UIStoryboard(name: "Tutorial", bundle: .main)
            var tmVC = tutoStory.instantiateViewController(withIdentifier: "MasterVC")
            self.present(tmVC, animated: false)
        }
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        //sidebar button
        var rvc = self.revealViewController()
        var side = UIBarButtonItem(image: UIImage(named: "sidemenu.png"), style: .done, target: rvc, action: #selector(rvc?.revealToggle(_:)))
        self.navigationItem.leftBarButtonItem = side
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = dele.memoList.count
        print("tableviw 개수카운트")
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
        print("cell 반환")

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //read_sg
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as! MemoReadVC
        vc.row = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
        print("셀렉됐을때 설정")
    }
    


}
