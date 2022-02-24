//
//  CashRegister.swift
//  BillBuddy
//
//  Created by Saransh Agarwal on 23/02/22.
//

import Foundation

class CashRegister{
    var itemName : String = ""
    var itemPrice : Int = 0
    var itemQuantity : Int = 0
    
    init(iName : String, iPrice : Int, iQuantity : Int){
        self.itemName = iName
        self.itemPrice = iPrice
        self.itemQuantity = iQuantity
    }
    
    func updateQuantity(iQuantityTaken : Int){
        self.itemQuantity = self.itemQuantity - iQuantityTaken
    }
    
    func getItemDetails() -> String{
        return self.itemName.description+" for $"+self.itemPrice.description+" each"
    }
    
    func getItemName()->String{
        return self.itemName
    }
    
    
    
    func getItemPrice()->Int{
        return self.itemPrice
    }
    
    func getItemQuantity()->Int{
        return self.itemQuantity
    }
    
    func setItemQuantity(newQuantity : Int){
        self.itemQuantity = newQuantity
    }
    
    
}
