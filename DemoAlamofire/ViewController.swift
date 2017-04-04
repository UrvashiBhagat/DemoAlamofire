//
//  ViewController.swift
//  DemoAlamofire
//
//  Created by Codiant_Macbook_Pro on 4/3/17.
//  Copyright © 2017 Codiant_Macbook_Pro. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tblView: UITableView!
    var arrList = [[String:AnyObject]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        callAlamofire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//MARK: Calling Webservice
    func callAlamofire(){
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (response) in
            print(response)
            let tempNames = response.result.value as? [String : Any]
            let responseData = tempNames?["contacts"]
            self.arrList = responseData as! [[String:AnyObject]]
            print(self.arrList.count)
            self.tblView.reloadData()
        }
    }
//MARK: TableView Datasource and Delegate Methods
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.arrList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
    let dict:NSDictionary = self.arrList[indexPath.row]as NSDictionary
    let arrPhone:NSDictionary = dict.value(forKey: "phone")as! NSDictionary
    let strPhone:String = arrPhone.value(forKey: "mobile")as! String
    print(strPhone)
    cell.textLabel?.text = dict.value(forKey: "name")as? String
    cell.detailTextLabel?.text = dict.value(forKey: "email")as? String
    return cell
   }
    
}
