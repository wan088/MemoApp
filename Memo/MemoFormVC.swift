//
//  MemoFormVC.swift
//  Memo
//
//  Created by Yongwan on 31/05/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController, UINavigationControllerDelegate{
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    @IBAction func save(_ sender: Any) {
        guard !contents.text.isEmpty else{
            let alert = UIAlertController(title: "텍스트 등록", message: "텍스트를 입력해주세요", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
            return
        }
        let memoData = MemoData()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        memoData.contents = contents.text
        memoData.title = navigationItem.title
        memoData.image = preview.image
        memoData.memoIdx = appDelegate.memoList.count
        memoData.regdate = Date()
        
        appDelegate.memoList.append(memoData)
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func pick(_ sender: Any) {
        let alert = UIAlertController(title: "사진모드", message: "촬영 or 앨범 \n 선택하세요", preferredStyle: .actionSheet)
        let cam = UIAlertAction(title: "카메라", style: .default){(action) in
            self.useCamera()
        }
        let pho = UIAlertAction(title: "앨범", style: .default){(action) in
            self.useLibrary()
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        alert.addAction(cam)
        alert.addAction(pho)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    func useCamera(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }
    func useLibrary(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contents.autocapitalizationType = UITextAutocapitalizationType.none
        contents.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MemoFormVC: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        var tmp = textView.text as NSString
        var len = tmp.length < 15 ? tmp.length : 15
        navigationItem.title = tmp.substring(to: len)
    }
}
extension MemoFormVC: UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        picker.dismiss(animated: false)
        
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
