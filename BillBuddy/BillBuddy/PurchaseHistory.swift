//
//  PurchaseHistory.swift
//  BillBuddy
//
//  Created by Saransh Agarwal on 25/02/22.
//

import Foundation

class PurchaseHistory{
    
    
    var itemPurchaseName : String = ""
    var itemPurchaseTotalPricePaid : Int = 0
    var itemPurchaseQuantity : Int = 0
    var itemPurchaseDate : String = ""
    
    init(purchasedName : String, totalPurchasedPrice : Int, purchasedQuantity : Int){
        self.itemPurchaseName = purchasedName
        self.itemPurchaseTotalPricePaid = totalPurchasedPrice
        self.itemPurchaseQuantity = purchasedQuantity
        
        
        
        
//        self.itemPurchaseDate = Date()
        
        let currDate = Date()
        let format = DateFormatter()
        format.timeZone = .current
        format.dateFormat = "MM/dd/yyyy HH:mm:ss a"
        self.itemPurchaseDate = format.string(from: currDate)
    }
    
    init(){
        self.itemPurchaseName = ""
        self.itemPurchaseTotalPricePaid = 0
        self.itemPurchaseQuantity = 0
        self.itemPurchaseDate = ""
    }
    
    
    
    func getItemDetails() -> String{
        return self.itemPurchaseName.description+"(s)  - Total Bill $"+self.itemPurchaseTotalPricePaid.description
    }
    
    func getItemName()->String{
        return self.itemPurchaseName
    }
    
    
    func getItemPrice()->Int{
        return self.itemPurchaseTotalPricePaid
    }
    
    func getItemPurchaseQuantity()->Int{
        return self.itemPurchaseQuantity
    }
    
    func getItemPurchaseDate()->String{
        return self.itemPurchaseDate
    }
    
}
