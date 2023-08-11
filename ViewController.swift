//
//  ViewController.swift
//  FaceIDProject
//
//  Created by Mustafa Kemal ARDA on 10.08.2023.
//

import UIKit
import LocalAuthentication


class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light     // Telefonun dark modu ne olursa olsun  light mod aktif olacaktır.
        
        myLabel.text = ""                       // Uygulama ilk açıldığında label yazısı boş gözükecektir.
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        let authContext = LAContext()       // Doğrulama işlemi için kullanıln obje
        
        var error: NSError?             // Hata mesajı için değişken oluşturmak gerekiyor
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {     // Doğrulama işlemi yapmak için
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in     // Doğrulama aşaması
                if success == true {
                    // success auth
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"
                    }
                    
                }
            }
            
        }
        
        
    }
    
}

