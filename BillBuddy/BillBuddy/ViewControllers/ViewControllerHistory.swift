//
//  ViewControllerHistory.swift
//  BillBuddy
//
//  Created by Saransh Agarwal on 23/02/22.
//

import UIKit

class ViewControllerHistory: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    var register : HeadManager = HeadManager()
    var itemIndex : Int = 0
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HeadManager.purchaseHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellForHistoryItem")
        
        cell.textLabel!.text = HeadManager.purchaseHistory[indexPath.row].getItemDetails()
        cell.detailTextLabel?.text = "Quantity Bought : " + HeadManager.purchaseHistory[indexPath.row].getItemPurchaseQuantity().description
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toItemHistoryDetails", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewControllerItemHistoryDetails{
            destination.itemIndexForHistory = itemIndex
            destination.historyItem = HeadManager.purchaseHistory[itemIndex]
        }
    }
    

}
