//
//  ViewController.swift
//  BillBuddy
//
//  Created by Saransh Agarwal on 23/02/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var localQuantity : String = ""
    var localPrice : Int  = 0
    var localTotal : Int = 0
    var itemIndex : Int = 0
    
    @IBOutlet weak var labelQuantity: UILabel!
    
    @IBOutlet weak var labelProductType: UILabel!
    
    @IBOutlet weak var labelTotal: UILabel!
    
    @IBOutlet weak var billTable: UITableView!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if(HeadManager.registerList.count == 0){
            HeadManager.registerList.append(CashRegister(iName: "Pant", iPrice: 6, iQuantity: 50))
            HeadManager.registerList.append(CashRegister(iName: "Shirt", iPrice: 5, iQuantity: 60))
            HeadManager.registerList.append(CashRegister(iName: "Tie", iPrice: 2, iQuantity: 30))
            HeadManager.registerList.append(CashRegister(iName: "Belt", iPrice: 2, iQuantity: 25))
            HeadManager.registerList.append(CashRegister(iName: "Socks", iPrice: 1, iQuantity: 40))
            HeadManager.registerList.append(CashRegister(iName: "Wallet", iPrice: 3, iQuantity: 15))
            HeadManager.registerList.append(CashRegister(iName: "Perfume", iPrice: 3, iQuantity: 20))
            HeadManager.registerList.append(CashRegister(iName: "Shoes", iPrice: 4, iQuantity: 30))
            HeadManager.registerList.append(CashRegister(iName: "Coat", iPrice: 8, iQuantity: 20))
            HeadManager.registerList.append(CashRegister(iName: "Jacket", iPrice: 9, iQuantity: 20))
        }else{
            billTable.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated : Bool){
        super.viewWillAppear(true)
        billTable.reloadData()
    }
    override func viewDidAppear(_ animated : Bool) {
        super.viewDidAppear(true)
        billTable.reloadData()
    }
    
    @IBAction func numPadClicked(_ sender: Any) {
        let op : String = ((sender as! UIButton).titleLabel?.text)!
        print(op)
        if(op == "Buy"){
            print("Local Price : \(localPrice)")
            print("Local Quantity : \((localQuantity as NSString).integerValue)")
            let total = localPrice * (localQuantity as NSString).integerValue
            let quantityInStock :Int = HeadManager.registerList[itemIndex].getItemQuantity()
            if(quantityInStock<((localQuantity as NSString).integerValue)){
                let alert = UIAlertController(title: "Alert", message: "Can't buy more than stock quantity", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                HeadManager.registerList[itemIndex].updateQuantity(iQuantityTaken: (localQuantity as NSString).integerValue)
                print(total)
                
                HeadManager.purchaseHistory.append(PurchaseHistory(purchasedName: HeadManager.registerList[itemIndex].getItemName().description, totalPurchasedPrice: total, purchasedQuantity: (localQuantity as NSString).integerValue))
            }
            self.billTable.reloadData()
            self.labelTotal.text = "$"+String(total)+""
            self.labelQuantity.text = "Quantity : 0"
            self.localQuantity = ""
            self.labelProductType.text = "Product"
            self.printAllItems()
            
        }else{
            localQuantity = localQuantity+op
            labelQuantity.text = "Quantity : "+localQuantity
        }
    }
    

    
    func printAllItems(){
        for currItem in HeadManager.registerList{
            print(currItem.getItemDetails())
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HeadManager.registerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "itemCell")
        
        cell.textLabel!.text = HeadManager.registerList[indexPath.row].getItemDetails()
        cell.detailTextLabel?.text = "Quantity : " + HeadManager.registerList[indexPath.row].getItemQuantity().description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        labelProductType.text = "Product : "+HeadManager.registerList[indexPath.row].getItemName().description
        localPrice = HeadManager.registerList[indexPath.row].getItemPrice()
        itemIndex = indexPath.row
    }


}

