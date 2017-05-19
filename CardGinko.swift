//
//  CardGinko.swift
//  CardAnimateVF
//
//  Created by Victor on 5/19/17.
//  Copyright © 2017 Azcatl. All rights reserved.
//

import UIKit

import UIKit


class CardGinko : UIButton{
    
    var numberCard : String = ""
    var visibleCursor: Bool = false
    var namebank : String = "Bank Name"
    var namePerson : String = "Victor Manuel Lagunas Franco"
    var timeIntervaloCursor : CGFloat = 1.0
    var repeatCursorMove : Bool = true
    var masterVisible : Bool = false
    var visaVisible : Bool = false
    var timer : Timer?
    var stopAnimation : Bool  = false
    //Array of position cursor in animation
    let positionCursorAnimation: [CGFloat] = [4,12,19,26,38,38,46,55,73,79,79,87,93,108,115,115,121,129,129,135.5]
    var positionCursor:CGFloat = 0
    
    /*
     Cursor Position Animation
     一　１１。５
     　二　１８。５
     　三　２５。５
     　 四　３２。５
     
     　 五　４４。５
     　六　５２。５
     　七　５９。５
     八　６７。５
     
     九　７９。５
     十 ８７。５
     十一　９５。５
     十二　１０１。５
     
     十三　１１３。５
     十四　１２１。５
     十五１２８。５
     十六　１３５。５
     */
    override public func draw(_ rect: CGRect) {
        CardAnimateWrite.drawCanvas1(frame: self.bounds, numberCard: numberCard, cursorVisible: visibleCursor, positionCursorX: positionCursor, namebank: namebank, namePerson: namePerson, mastercard: masterVisible, visa: visaVisible,colorEdit: UIColor(red: 0.800, green: 0.320, blue: 0.320, alpha: 1.000))
       
        animation()
    }
    //Change position Cursor in the animation Card
    func changedPositionCursor (position:Int){
        
        positionCursor = positionCursorAnimation[position]
        setNeedsDisplay()
    }
    //Card Type Visa
    func setVisa(visible: Bool){
        visaVisible = visible
    }
    //Card Type Master Card
    func setMasterCard(visible : Bool){
        masterVisible = visible
    }
    //Card Name Person
    func setNamePerson(name: String){
        namePerson = name
    }
    
    //Name Bank
    func setNameBank(name:String){
        namebank = name
    }
    //init position 0 cursor
    func restartCursor (){
        
        positionCursor = positionCursorAnimation[0]
    }
    
    //Update the number card with animation
    func changedNumberCard (numberCard:String){
        
        self.numberCard = numberCard
        
        changedPositionCursor(position: self.numberCard.characters.count)
        
        //Print Credit card number
        print("クレジットカード: \(self.numberCard.characters.count)")
        print(positionCursor)
        update()
    }
    
    //Animation timer
    func animation(){
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(timeIntervaloCursor), target: self, selector: #selector(self.updateCursorAnimation), userInfo: nil, repeats: repeatCursorMove)
    }
    
    //Update Cursor animation
    func updateCursorAnimation(){
        
        if !stopAnimation {
            if visibleCursor {
                visibleCursor = false
                update()
            }else{
                visibleCursor = true
                update()
            }
        }else{
            visibleCursor = false
            update()
        }
    }
    
    //Repaint canvas object
    func update () {
        
        setNeedsDisplay()
    }
    
    //Stop animation cursor
    func stopAnimationCursor () {
        
        stopAnimation = true
        update()
    }
    
    //Start animation cursor
    func startAnimationCursor() {
        stopAnimation = false
        update()
    }
    /*
     Funcion para poner - después de 4 caracteres insertados en la tarjeta
     */
    
    func validateNumber(numberCardCharacter:String, textFieldCard:UITextField) ->String{
        
        if textFieldCard.text!.characters.count == 4{
            textFieldCard.text! += "-"
            secondTryForSymbol(numberCardCharacter: numberCardCharacter)
            return textFieldCard.text!
        }
        else if textFieldCard.text!.characters.count == 9{
            textFieldCard.text! += "-"
            secondTryForSymbol(numberCardCharacter: numberCardCharacter)
            return textFieldCard.text!
        }else if textFieldCard.text!.characters.count == 14{
            textFieldCard.text! += "-"
            secondTryForSymbol(numberCardCharacter: numberCardCharacter)
            return textFieldCard.text!
        }
        
        return numberCardCharacter
    }
    
    //Make other try for print second character
    func secondTryForSymbol(numberCardCharacter : String){
        changedNumberCard(numberCard: numberCardCharacter)
    }
    //Get numberCard in String
    func getNumberCardText()->String{
        return ""
    }
    
    //Get numberCard in Int
    func getNumberCard()->Int{
        return 0
    }
    
}

