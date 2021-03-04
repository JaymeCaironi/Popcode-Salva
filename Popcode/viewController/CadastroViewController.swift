//
//  CadastroViewController.swift
//  Popcode
//
//  Created by Jayme Antonio da Rosa Caironi on 04/03/21.
//

import UIKit
import FirebaseAuth

class CadastroViewController: UIViewController {
    
    @IBOutlet weak var campoNome: UITextField!
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    var auth: Auth!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        auth = Auth.auth()
            
        
    }
    
    @IBAction func cadastrar(_ sender: Any) {
        
        if let nome = campoNome.text {
            if let email = campoEmail.text {
                if let senha = campoSenha.text {
                    
                    auth.createUser(withEmail: email, password: senha) { (usuario, erro) in
                        if erro == nil {
                            print("Usuario cadastrado com Sucesso")
                        }else{
                            print("Erro ao cadastrar Usuario")
                        }
                    }
                }else{
                    print("Digite um Senha")
                }
            }else{
                print("Digite um Email")
            }
        }else{
            print("Digite um Nome")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
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
