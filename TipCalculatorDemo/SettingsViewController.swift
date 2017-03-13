//
//  SettingsViewController.swift
//  TipCalculatorDemo
//
//  Created by Mendoza, Alejandro on 3/12/17.
//  Copyright © 2017 Alejandro Mendoza. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var tableData: [String] = ["Dollar", "Rupee", "Yen", "Euro", "Pound", "Shekel"]
    var currencies: [String] = ["$", "₹", "¥", "€", "£", "₪"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let currency = defaults.string(forKey: "currency")
        print("Loaded settings page with crrency: " + currency!)
        
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = self.tableData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertView = UIAlertView()
        alertView.addButton(withTitle: "Ok")
        alertView.title = "Row Selected"
        alertView.message = self.currencies[indexPath.row]
        alertView.show()
        
        let defaults = UserDefaults.standard
        defaults.set(self.currencies[indexPath.row], forKey: "currency")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
