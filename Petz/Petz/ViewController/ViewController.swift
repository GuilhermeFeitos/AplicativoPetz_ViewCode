//
//  ViewController.swift
//  Petz
//
//  Created by Gui Feitosa on 21/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension ViewController: LoginScreenProtocol {
    func actionEsqueciSenhaButton() {
        print("Deu certo Esqueci Senha Button")
    }
    
    func actionLoginButton() {
        print("Deu certo Login Button")
    }
    
    func actionRegisterButton() {
        print("Deu certo Register Button")
    }
    
    func actionStartWithoutButton() {
        print("Deu certo Start without Button")
    }
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
}
