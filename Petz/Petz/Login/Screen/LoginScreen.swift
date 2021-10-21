//
//  LoginScreen.swift
//  Petz
//
//  Created by Gui Feitosa on 21/10/21.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionEsqueciSenhaButton()
    func actionLoginButton()
    func actionRegisterButton()
    func actionStartWithoutButton()
}

class LoginScreen: UIView {
    
    weak var delegate: LoginScreenProtocol?
        
    func delegate(delegate: LoginScreenProtocol?) {
            self.delegate = delegate
    }

    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
        
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no //auto correção do teclado
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "E-mail ou CPF"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no //auto correção do teclado
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true //mascara a senha ao ser digitada
        textField.placeholder = "Senha"
        textField.textColor = .darkGray
        return textField
    }()
        
    lazy var esqueciSenhaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueci a senha", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(self.tappedEsqueciSenhaButton), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ENTRAR", for: .normal) //Texto do botão
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18) // Fonte do Botão
        button.setTitleColor(.white, for: .normal) // Cor do texto do Botão
        button.clipsToBounds = true // Alterar as bordas para não ficar quadrada
        button.layer.cornerRadius = 7.5 //arredondar borda
        button.backgroundColor = UIColor(red: 0.18, green: 0.55, blue: 0.34, alpha: 1.00) // cor do botão
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside) //Pegar as ações do nosso botão
        return button
    }()
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ainda não tem conta? Clique aqui.", for: .normal) //Texto do botão
        button.setTitleColor(.blue, for: .normal) // Cor do texto do Botão
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.00, green: 0.20, blue: 1, alpha: 1.0).cgColor // Cor da borda do botão
        button.clipsToBounds = true // Alterar as bordas para não ficar quadrada
        button.layer.cornerRadius = 7.5 //arredondar borda
        button.backgroundColor = .clear // cor do botão
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    lazy var startWithoutButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar sem login >", for: .normal) //Texto do botão
        button.setTitleColor(.blue, for: .normal) // Cor do texto do Botão
        button.clipsToBounds = true // Alterar as bordas para não ficar quadrada
        button.backgroundColor = .clear // cor do botão
        button.addTarget(self, action: #selector(self.tappedStartWithoutButton), for: .touchUpInside)
        return button
    }()
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.configSuperView()
        self.setUPContraints()
    }
        
    private func configBackground() {
        self.backgroundColor = UIColor(red: 255, green: 0.84, blue: 0, alpha: 1.0)
    }
    
    private func configSuperView() {
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.esqueciSenhaButton)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
        self.addSubview(self.startWithoutButton)
    }
    
    public func configTextFieldDelegate (delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    @objc private func tappedEsqueciSenhaButton() {
        self.delegate?.actionEsqueciSenhaButton()
//        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @objc private func tappedStartWithoutButton() {
        self.delegate?.actionStartWithoutButton()
    }
                
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
        /*
            equal to: basear em um determinado elemento
            constant: me afastar/aproximar do elemento referente(equalTo)
            equalToConstant: setando um valor para um determinado elemento
            */
        
    private func setUPContraintsTextFields(){
        NSLayoutConstraint.activate([
        
        //Configurando as Constraint do Email Textfield
        self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 60),
        self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
        self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
        self.emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        self.emailTextField.heightAnchor.constraint(equalToConstant: 40),
                
        //Configurando as Constraint do Password Textfield
        self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 16),
        self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
        self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
        self.passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        self.passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
    }
    
    private func setUPContraintsImageView(){
        NSLayoutConstraint.activate([
     
        //Configurando as Constraint do meu LogoImageView
        self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
        self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
        self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
        self.logoAppImageView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    private func setUPContraintsButton(){
        NSLayoutConstraint.activate([
    
        //Configurando as Constraints do Botão Esqueci a senha
        self.esqueciSenhaButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 8),
        self.esqueciSenhaButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            
        //Configurando as Constraints do Botão Entrar
        self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 50),
        self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
        self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
        self.loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        self.loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
        //Configurando as Contrainsts do Botão Ainda não tem conta? Clique aqui.
        self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
        self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
        self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
        
        //Configurando as Contrainsts do Botão Começar sem login >
        self.startWithoutButton.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor, constant: 8),
        self.startWithoutButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
        self.startWithoutButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
        self.startWithoutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        self.startWithoutButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
        self.startWithoutButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    private func setUPContraints() {
        
        setUPContraintsImageView()
        setUPContraintsTextFields()
        setUPContraintsButton()
    }
}
