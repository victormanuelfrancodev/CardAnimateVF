//
//  ViewController.swift
//  CardAnimateVF
//
//  Created by Victor on 5/19/17.
//  Copyright © 2017 Azcatl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cardView: CardGinko!
    @IBOutlet weak var cardText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configCard()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickInCard(_ sender: Any) {
        
        cardText.isUserInteractionEnabled = true
        cardText.becomeFirstResponder()
    }
    func configCard(){
        cardText.isHidden = true
        self.cardText.keyboardType = .numberPad
        
        //cardView.stopAnimationCursor()
        cardView.setMasterCard(visible: true)
        cardView.setNameBank(name: "Banco")
        cardView.setNamePerson(name: "Enoc")
        //cardView.changedNumberCard(numberCard: "2345-1234-1234-1234")
        
    }
    
    func setTextCard (text: String){
        cardView.changedNumberCard(numberCard: text)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*Detecta cuando se inserta y se quita un caracter de un textfield */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /*Borra caracteres si el usuario oprime el boton de borrar */
        if string.characters.count == 0 && range.length > 0{
            cardText.text?.remove(at: (cardText.text?.index(before: (cardText.text?.endIndex)!))!)
            cardView.changedNumberCard(numberCard: cardText.text!)
            return false
        }else{
            /*Detecta cuando el numero de la tarjeta es mayor del numero que va a recibir */
            if(cardText.text!.characters.count > 18){
                cardView.changedNumberCard(numberCard: cardText.text!)
                cardText.deleteBackward()
                // print(captureNumberTextField.text!)
            }else{
                let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
                cardView.changedNumberCard(numberCard: cardView.validateNumber(numberCardCharacter: newString,textFieldCard: cardText))
                cardView.changedNumberCard(numberCard: cardView.validateNumber(numberCardCharacter: newString,textFieldCard: cardText))
            }
            return true
        }
    }


}

