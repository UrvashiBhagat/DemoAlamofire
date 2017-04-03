//
//  ViewController.swift
//  DemoAlamofire
//
//  Created by Codiant_Macbook_Pro on 4/3/17.
//  Copyright © 2017 Codiant_Macbook_Pro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tblView: UITableView!
    var arrList = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAlamofire()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func callAlamofire(){
        Alamofire.request("http://api.androidhive.info/contacts/").responseData { (response) in
            print(response)
            let swiftyJsonVar = JSON(response.result.value!)
            print(swiftyJsonVar)
            let responseData = swiftyJsonVar["contacts"].arrayObject
            self.arrList = responseData as! [[String:AnyObject]]
            print(self.arrList.count)
            self.tblView.reloadData()
        }
    }

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.arrList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
    let dict:NSDictionary = self.arrList[indexPath.row]as NSDictionary
    cell.textLabel?.text = dict.value(forKey: "name")as? String
    cell.detailTextLabel?.text = dict.value(forKey: "email")as? String
    return cell
}
}
