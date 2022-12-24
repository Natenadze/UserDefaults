//
//  ViewController.swift
//  UserDefaults
//
//  Created by Davit Natenadze on 23.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = userDefaults.name
//        let user = User(name: "lado", surname: "chania")
//        userDefaults.userInfo = user
        print(userDefaults.name)
        userDefaults.removeObject(forKey: UserDefaults.UserDefKeys.name.rawValue)
//        userDefaults.removeObject(forKey: userDefaults.name)
//        print(userDefaults.userInfo?.name ?? "araferi")
        
    }

    @IBAction func savePressed(_ sender: UIButton) {
        labelText.text = textField.text
//        UserDefaults.standard.set(textField.text, forKey: "testText")
        userDefaults.name = textField.text ?? "asd"
        
    }
    
}




extension UserDefaults {
    enum UserDefKeys: String {
        case name, userInfo, ddd
    }
    
    var name: String {
        get {
            string(forKey: UserDefKeys.name.rawValue) ?? "empty String"
        }
        set {
            set(newValue, forKey: UserDefKeys.name.rawValue)
        }
    }
    
    var userInfo: User? {
        get {
            if let data = object(forKey: UserDefKeys.userInfo.rawValue)  as? Data {
                let result = try? JSONDecoder().decode(User.self, from: data)
                return result!
            }
            return nil
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            setValue(data, forKey: UserDefKeys.userInfo.rawValue)
        }
    }
    
}
