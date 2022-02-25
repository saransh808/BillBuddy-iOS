//
//  ViewControllerReStock.swift
//  BillBuddy
//
//  Created by Saransh Agarwal on 23/02/22.
//

import UIKit

class ViewControllerReStock: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var localQuantity : Int = 0
    var itemIndex : Int = 0
    
    @IBOutlet weak var textNewStockValue: UITextField!
    
    @IBOutlet weak var reStockTable: UITableView!
    
    var register : HeadManager = HeadManager()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HeadManager.registerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForReStock", for: indexPath)
//        cell.textLabel!.text = HeadManager.registerList[indexPath.row].getItemDetails()
//        cell.detailTextLabel?.text = "Sammmm"
//        return cell
        
        
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellForReStock")
        
        cell.textLabel!.text = HeadManager.registerList[indexPath.row].getItemDetails()
        cell.detailTextLabel?.text = "Quantity Available : " + HeadManager.registerList[indexPath.row].getItemQuantity().description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textNewStockValue.text = HeadManager.registerList[indexPath.row].getItemQuantity().description
        localQuantity = HeadManager.registerList[indexPath.row].getItemQuantity()
        itemIndex = indexPath.row
    }
    
    
    
    @IBAction func restockOrCancleClicked(_ sender: Any) {
        let op : String = ((sender as! UIButton).titleLabel?.text)!
        print(op)
        if(op == "ReStock"){
            HeadManager.registerList[itemIndex].setItemQuantity(newQuantity: ((textNewStockValue.text?.description ?? "0") as NSString).integerValue)
            reStockTable.reloadData()
            
            //ViewController.billTable.reloadData()
        }else{
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
