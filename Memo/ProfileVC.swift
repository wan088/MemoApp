//
//  ProfileVC.swift
//  Memo
//
//  Created by Yongwan on 14/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var profileImage = UIImageView()
    var tv = UITableView()
    var uManager = UserInfoManager()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.accessoryType = .disclosureIndicator
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "이름"
            cell.detailTextLabel?.text = "김용완"
        case 1:
            cell.textLabel?.text = "계정"
            cell.detailTextLabel?.text = "wanrage@naver.com"
        default: break
        }
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        //뒤로가기 버튼
        var backBtn = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(close(_:)))
        self.navigationItem.leftBarButtonItem = backBtn
        
        //배경 사진
        var bg = UIImageView(image: UIImage(named: "profile-bg.png"))

        bg.frame.size = CGSize(width: bg.frame.width, height: bg.frame.height)
        bg.center = CGPoint(x: self.view.frame.width/2, y: 40)
        
        bg.layer.cornerRadius = bg.frame.width/2
        bg.layer.borderWidth = 0
        bg.layer.masksToBounds = true
        
        self.view.addSubview(bg)

        // 프로필 사진
        self.profileImage.image = UIImage(named: "account.jpg")
        self.profileImage.frame.size = CGSize(width: 100, height: 100)
        self.profileImage.center = CGPoint(x: self.view.frame.width/2, y: 270)
        
        self.profileImage.layer.cornerRadius = profileImage.frame.width/2
        self.profileImage.layer.borderWidth = 0
        self.profileImage.layer.masksToBounds = true
        
        self.view.addSubview(profileImage)
        
        //테이블 뷰
        var x: CGFloat = 0
        var y: CGFloat = self.profileImage.frame.origin.y + self.profileImage.frame.size.height + 15
        var width: CGFloat = self.view.frame.width
        var height:CGFloat = 100
        
        self.tv.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(tv)
        
        tv.delegate = self
        tv.dataSource = self
        
        self.view.bringSubviewToFront(tv)
        self.view.bringSubviewToFront(profileImage)
        
        
    }
    //Login
    @objc func doLogin(_ sender: Any){
        var loginAlert = UIAlertController(title: "LOGIN", message: nil, preferredStyle: .alert)
        loginAlert.addTextField(){ tf in
            tf.placeholder = "Your Account"
        }
        loginAlert.addTextField(){tf in
            tf.placeholder = "Password"
            tf.isSecureTextEntry = true
        }
        loginAlert.addAction(UIAlertAction(title: "Login", style: .default){(_) in
            var account = loginAlert.textFields?[0].text ?? ""
            var password = loginAlert.textFields?[1].text ?? ""
            if self.uManager.login(account: account, password: password){
                //로그인 시 처리
                
            }else{
                let msg = "로그인에 실패하였습니다"
                let failAlert = UIAlertController(title: "로그인 실패", message: msg, preferredStyle: .alert)
                failAlert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
                self.present(failAlert, animated: true)
            }
        })
        loginAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(loginAlert, animated: true)
        
    }
    //Logout
    @objc func doLogout(_ sender: Any){
        let alert = UIAlertController(title: "로그아웃", message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "로그아웃", style: .default){action in
            if self.uManager.logout(){
                    //로그아웃 시 처리
            }
        })
        
    }
    
    
    @objc func close(_ sender: Any){
        self.dismiss(animated: true)
    }

}
