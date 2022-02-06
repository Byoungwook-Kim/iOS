//
//  Utils.swift
//  MyMemory
//
//  Created by prologue on ..
//  Copyright © 2017년 rubypaper. All rights reserved.
//

import Security
import Alamofire

class TokenUtils {
    func save(_ service: String, account: String, value: String) {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService : service,
            kSecAttrAccount : account,
            kSecValueData : value.data(using: .utf8, allowLossyConversion: false)!
        ]
        
        SecItemDelete(keyChainQuery)
        
        let status: OSStatus = SecItemAdd(keyChainQuery, nil)
        assert(status == noErr, "토큰 값 저장에 실패했습니다.")
        NSLog("status=\(status)")
    }
    
    func load(_ service: String, account: String) -> String? {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService : service,
            kSecAttrAccount : account,
            kSecReturnData : kCFBooleanTrue,
            kSecMatchLimit : kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(keyChainQuery, &dataTypeRef)
        
        if (status == errSecSuccess) {
            let retrievedData = dataTypeRef as! Data
            let value = String(data: retrievedData, encoding: String.Encoding.utf8)
            return value
        } else {
            print("에러입니다.")
            return nil
        }
    }
    
    func delete(_ service: String, account: String) {
        let keyChainQuery: NSDictionary = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService : service,
            kSecAttrAccount : account
        ]
        
        let status = SecItemDelete(keyChainQuery)
        assert(status == noErr, "삭제에 실패했습니다.")
        NSLog("status=\(status)")
    }
    
    func getAuthorizationheader() -> HTTPHeaders? {
        let serviceID = "kr.co.rubypaper.MyMemory"
        if let accessToken = self.load(serviceID, account: "accessToken") {
            return [" Authorization" : "Bearer \(accessToken)"] as HTTPHeaders
        } else {
            return nil
        }
    }
    
    
}

extension UIViewController {
  var tutorialSB: UIStoryboard {
    return UIStoryboard(name: "Tutorial", bundle: Bundle.main)
  }
  func instanceTutorialVC(name: String) -> UIViewController? {
    return self.tutorialSB.instantiateViewController(withIdentifier: name)
  }
}

extension UIViewController {
    func alert(_ message: String, completion: (()-> Void)? = nil) {
        DispatchQueue.main.sync {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .cancel){
                (_) in completion?()
            }
            alert.addAction(okAction)
            self.present(alert, animated: false)
        }
    }
}
