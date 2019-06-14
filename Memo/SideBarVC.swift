//
//  SideBarVC.swift
//  Memo
//
//  Created by Yongwan on 14/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class SideBarVC: UITableViewController {
    
    
    var nameLabel = UILabel()
    var emailLabel = UILabel()
    var userImage = UIImageView()
    
    let tit = ["새 글 작성하기", "친구 새 글", "달력으로 보기", "공지사항", "통계", "계정관리"]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tit.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "c") ?? UITableViewCell(style: .default, reuseIdentifier: "c")
        cell.textLabel?.text = "\(tit[indexPath.row])"
        cell.imageView?.image = UIImage(named: "icon0\(indexPath.row+1)")
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        headerView.backgroundColor = .brown
        
        nameLabel = UILabel(frame: CGRect(x: 70, y: 15, width: self.view.frame.width, height: 30))
        self.nameLabel.text = "김용완"
        self.nameLabel.textColor = .white
        headerView.addSubview(nameLabel)

        emailLabel = UILabel(frame: CGRect(x: 70, y: 30, width: self.view.frame.width, height: 30))
        self.emailLabel.text = "wanrage@naver.com"
        self.emailLabel.textColor = .white
        headerView.addSubview(emailLabel)
        
        userImage.image = UIImage(named: "account.jpg")
        self.userImage.frame = CGRect(x: 10, y: 15, width: 50, height: 50)
        self.userImage.layer.cornerRadius = self.userImage.frame.width/2
        self.userImage.layer.masksToBounds = true
        headerView.addSubview(userImage)
        
        self.tableView.tableHeaderView = headerView
    
        
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            var navi = self.revealViewController()?.frontViewController as! UINavigationController
            var uv = self.storyboard?.instantiateViewController(withIdentifier: "memoForm")
            navi.pushViewController(uv!, animated: true)
            self.revealViewController()?.revealToggle(animated: true)
        case 5:
            var pvc = self.storyboard?.instantiateViewController(withIdentifier: "profile")
            self.revealViewController()?.frontViewController.present(pvc!, animated: true){
                self.revealViewController()?.revealToggle(self)
            }
        default:
            print("?")
        }
    }

}
