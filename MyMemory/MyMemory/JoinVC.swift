//
//  JoinVC.swift
//  MyMemory
//
//  Created by Byoung_wook on 2021/10/19.
//  Copyright © 2021 rubypaper. All rights reserved.
//

import UIKit
import Alamofire

class JoinVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    var isCalling = false
    
    var fieldAccount: UITextField!
    var fieldPassword: UITextField!
    var fieldName: UITextField!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.profile.layer.cornerRadius = self.profile.frame.width / 2
        self.profile.layer.masksToBounds = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedProfile))
        self.profile.addGestureRecognizer(gesture)
        self.view.bringSubview(toFront: self.indicatorView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let tfFrame = CGRect(x: 20, y: 0, width: cell.bounds.width - 20, height: 37)
        switch indexPath.row {
        case 0:
            self.fieldAccount = UITextField(frame: tfFrame)
            self.fieldAccount.placeholder = "계정(이메일)"
            self.fieldAccount.borderStyle = .none
            self.fieldAccount.autocapitalizationType = .none
            self.fieldAccount.font = UIFont.systemFont(ofSize: 14)
            cell.addSubview(self.fieldAccount)
            
        case 1:
            self.fieldPassword = UITextField(frame: tfFrame)
            self.fieldPassword.placeholder = "비밀번호"
            self.fieldPassword.borderStyle = .none
            self.fieldPassword.autocapitalizationType = .none
            self.fieldPassword.font = UIFont.systemFont(ofSize: 14)
            cell.addSubview(self.fieldPassword)
            
        case 2:
            self.fieldName = UITextField(frame: tfFrame)
            self.fieldName.placeholder = "이름"
            self.fieldName.borderStyle = .none
            self.fieldName.autocapitalizationType = .none
            self.fieldName.font = UIFont.systemFont(ofSize: 14)
            cell.addSubview(self.fieldName)
            
        default:
            ()
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    @IBAction func submit(_ sender: Any) {
        let profile = UIImagePNGRepresentation(self.profile.image!)?.base64EncodedString()
        
        let param: Parameters = [
            "account" : self.fieldAccount.text!,
            "passwd" : self.fieldPassword.text!,
            "name" : self.fieldName.text!,
            "profile_image" : profile!
        ]
            
        let url = "http://swiftapi.rubypaper.co.kr:2029/userAccount/join"
        let call = Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default)
        
        call.responseJSON { res in
          // 인디케이터 뷰 애니메이션 종료
          self.indicatorView.stopAnimating()
          
          // 3-1. JSON 형식으로 값이 제대로 전달되었는지 확인
          guard let jsonObject = res.result.value as? [String: Any] else {
            self.isCalling = false
            self.alert("서버 호출 과정에서 오류가 발생했습니다.")
            return
          }
          
          // 3-2. 응답 코드 확인. 0이면 성공
          let resultCode = jsonObject["result_code"] as! Int
          if resultCode == 0 {
            self.alert("가입이 완료되었습니다.") {
              self.performSegue(withIdentifier: "backProfileVC", sender: self)
            }
          } else { // 3-4. 응답 코드가 0이 아닐 때에는 실패
            self.isCalling = false
            let errorMsg = jsonObject["error_msg"] as! String
            self.alert("오류발생 : \(errorMsg)")
          }
        }
    }
    
    @objc func tappedProfile(_ sender: Any) {
        let msg = "프로필 이미지를 읽어올 곳을 선택하세요."
        let sheet = UIAlertController(title: msg, message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        sheet.addAction(UIAlertAction(title: "저장된 앨범", style: .default) {(_) in
            selectLibrary(src: .savedPhotosAlbum)
        })
        
        sheet.addAction(UIAlertAction(title: "포토 라이브러리", style: .default) {(_) in
            selectLibrary(src: .photoLibrary)
        })
        
        sheet.addAction(UIAlertAction(title: "카메라", style: .default) {(_) in
            selectLibrary(src: .camera)
        })
        
        self.present(sheet, animated: false)

        func selectLibrary(src: UIImagePickerControllerSourceType) {
            if UIImagePickerController.isSourceTypeAvailable(src) {
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.allowsEditing = true
                
                self.present(picker, animated: false)
            } else {
                self.alert("사용할수 없는 타입입니다.")
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.profile.image = img
        }
        self.dismiss(animated: true)
    }
}
