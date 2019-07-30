//
//  TutorialMasterVC.swift
//  Memo
//
//  Created by Yongwan on 20/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class TutorialMasterVC: UIViewController {
    let maxPage = 4
    var pageVC: UIPageViewController!
    func instanceCVC(idx: Int) -> TutorialContentsVC{
        var cvc = instanceTutorialVC(name: "ContentsVC") as! TutorialContentsVC
        cvc.subject_text = "\(idx+1)번째 튜토리얼 화면"
        cvc.bgImg_imageName = "page\(idx)"
        cvc.pageIdx = idx
        return cvc
    }

    @IBAction func startBtn(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: UserInfoManager.UserInfoKey.tutorial)
        self.dismiss(animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageVC = self.instanceTutorialVC(name: "PageVC") as! UIPageViewController
        var cvc1 = instanceCVC(idx: 0)
        pageVC.setViewControllers([cvc1], direction: .forward, animated: true)
        //여기서 이미 페이지뷰컨의 뷰가 설정된건가?컨텐츠로?
        //print(pageVC.view)
        
        pageVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 50)
        
        pageVC.dataSource = self
        pageVC.delegate = self
        //페이지뷰컨을 자식뷰로 띄우기
        self.addChild(pageVC)
        self.view.addSubview(pageVC.view)
        pageVC.didMove(toParent: self)
        
        
    }

}
extension TutorialMasterVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    //앞쪽으로 넘겼을 때
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var nowIdx = ((viewController as! TutorialContentsVC).pageIdx)!
        if nowIdx == 0{
            return nil
        }
        return instanceCVC(idx: nowIdx-1)
    }
    
    //뒤로 넘겼을 때
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var nowIdx = ((viewController as! TutorialContentsVC).pageIdx)!
        if nowIdx == maxPage-1{
            return nil
        }
        return instanceCVC(idx: nowIdx+1)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.maxPage
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    
    
}
