//
//  TutorialMasterVC.swift
//  Memo
//
//  Created by Yongwan on 20/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class TutorialMasterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pageVC = self.instanceTutorialVC(name: "PageVC") as! UIPageViewController
        
        //여기서 이미 페이지뷰컨의 뷰가 설정된건가?컨텐츠로?
        //print(pageVC.view)
        
        pageVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 50)
        pageVC.view.backgroundColor = .purple
        
        
        //페이지뷰컨을 자식뷰로 띄우기
        self.addChild(pageVC)
        self.view.addSubview(pageVC.view)
        pageVC.didMove(toParent: self)
        
        
    }

}
