
import UIKit

class UserInfoManager{
    struct UserInfoKey{
        static var loginId = "lOGINID"
        static var account = "ACCOUNT"
        static var name = "NAME"
        static var profile = "PROFILE"
        static var tutorial = "TUTORIAL"
    }
    
    var loginid: Int{
        get{
            return UserDefaults.standard.integer(forKey: UserInfoKey.loginId)
        }
        set(v){
            UserDefaults.standard.set(v, forKey: UserInfoKey.loginId)
            UserDefaults.standard.synchronize()
        }
    }
    var account: String?{
        get{
            return UserDefaults.standard.string(forKey: UserInfoKey.account)
        }
        set(v){
            UserDefaults.standard.set(v, forKey: UserInfoKey.account)
            UserDefaults.standard.synchronize()
        }
    }
    var name: String?{
        get{
            return UserDefaults.standard.string(forKey: UserInfoKey.name)
        }
        set(v){
            UserDefaults.standard.set(v, forKey: UserInfoKey.name)
            UserDefaults.standard.synchronize()
        }
    }
    
    var profile: UIImage?{
        get{
            if let _profile = UserDefaults.standard.data(forKey: UserInfoKey.profile){
                return UIImage(data: _profile)
            }else{
                return UIImage(named: "account.jpg")
            }
        }
        set(v){
            if v != nil{
                var d: Data? = UIImage.pngData(v!)()
                UserDefaults.standard.set(d, forKey: UserInfoKey.profile)
                UserDefaults.standard.synchronize()
            }
        }
    }

    
    //Login 했는지 판별하는 연산 프로퍼티
    var isLogin: Bool{
        get{
            var ud = UserDefaults.standard
            if(self.loginid == 0 || self.account == nil){
                return false
            }else{
                return true
            }
        }
    }
    
    func login(account: String, password: String) -> Bool{
        if(account == "wanrage@naver.com" && password == "1234"){
            let ud = UserDefaults.standard
            ud.set(100, forKey: UserInfoKey.loginId)
            ud.set(account, forKey: UserInfoKey.account)
            ud.set("김용완", forKey: UserInfoKey.name)
            ud.synchronize()
            return true
        }
        return false
    }
    
    func logout()-> Bool{
        let ud = UserDefaults.standard
        ud.removeObject(forKey: UserInfoKey.account)
        ud.removeObject(forKey: UserInfoKey.loginId)
        ud.removeObject(forKey: UserInfoKey.name)
        ud.removeObject(forKey: UserInfoKey.profile)
        ud.synchronize()
        return true
    }
    
}
