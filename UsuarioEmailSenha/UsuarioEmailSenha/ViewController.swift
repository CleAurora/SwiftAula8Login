//
//  ViewController.swift
//  UsuarioEmailSenha
//
//  Created by Cleís Aurora Pereira on 14/09/20.
//  Copyright © 2020 Cleís Aurora Pereira. All rights reserved.
//

import UIKit

class Usuario {
    var email: String
    var senha: String
    
    init(email: String, senha: String) {
        self.email = email
        self.senha = senha
    }
    
    func cadastrar(){
        
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    @IBOutlet weak var validarButton: UIButton!
    
    var usuarios: [Usuario] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emailTextField.delegate = self
        senhaTextField.delegate = self
    }
    
    @IBAction func cadastrarTapped() {
        let usuario = Usuario(email: emailTextField.text ?? "", senha: senhaTextField.text ?? "")
        
        usuarios.append(usuario)
        
        emailTextField.text = ""
        senhaTextField.text = ""
    }
    
    @IBAction func validarTapped() {
        
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = senhaTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let hasItem = usuarios.contains { (item) -> Bool in
            item.email == email && item.senha == password
        }
        
        UIView.animate(withDuration: 0.35) {
            self.view.backgroundColor = hasItem ? UIColor.green : UIColor.red
        }
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let hasEmail = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
        let hasPassword = senhaTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
        
        UIView.animate(withDuration: 0.35) {
            self.cadastrarButton.isEnabled = hasEmail && hasPassword
            self.cadastrarButton.backgroundColor = self.cadastrarButton.isEnabled ? UIColor.link : UIColor.lightGray
            
            self.validarButton.isEnabled = hasEmail && hasPassword
            self.validarButton.backgroundColor = self.validarButton.isEnabled ? UIColor.link : UIColor.lightGray
            self.view.backgroundColor = UIColor.white
        }
    }
}

