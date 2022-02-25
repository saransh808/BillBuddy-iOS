//
//  ViewControllerItemHistoryDetails.swift
//  BillBuddy
//
//  Created by Saransh Agarwal on 25/02/22.
//

import UIKit

class ViewControllerItemHistoryDetails: UIViewController {

    @IBOutlet weak var labelProductHistoryDetails: UILabel!
    
    @IBOutlet weak var labelQuantity: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    var itemIndexForHistory : Int = 0;
    
    var historyItem : PurchaseHistory = PurchaseHistory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelProductHistoryDetails.text = "Item Name : "+historyItem.getItemName().description
        labelQuantity.text = "Total Quantity : " + historyItem.getItemPurchaseQuantity().description
        labelDate.text = "Purchase Date : " + historyItem.getItemPurchaseDate().description
        labelAmount.text = "Total Amount : " + historyItem.getItemPrice().description
        
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
