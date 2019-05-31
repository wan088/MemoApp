//
//  MemoReadVC.swift
//  Memo
//
//  Created by Yongwan on 31/05/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {

    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    var row :Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        var md = (UIApplication.shared.delegate as! AppDelegate).memoList[row]
        self.subject.text = md.title
        self.contents.text = md.contents
        if let im = md.image {
            self.img.image = im
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm에 작성됨"
        self.navigationItem.title = formatter.string(from: md.regdate!)
    }
    



}
