//
//  FirstViewController.swift
//  CoronaTracker
//
//  Created by AL Mustakim on 18/3/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    var baseObj = {Base.self}()
    var array = [Entries]()
    var details = [Entries]()
    
    
    var isSearching = false
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "করোনা ট্র্যাকার"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
    
        cell.countryName.text = array[indexPath.row].country ?? ""
        cell.efected.text = "\(array[indexPath.row].cases ?? "") Effected"
        cell.deth.text = "\(array[indexPath.row].deaths ?? "") Deth"
        cell.recover.text = "\(array[indexPath.row].recovered ?? "") Recovered"
        
        
        if indexPath.row % 2 == 0{
            cell.backgroundColor = .lightGray
        }
        else{
            cell.backgroundColor = .gray
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        vc?.cn = array[indexPath.row].country ?? ""
        vc?.totl = array[indexPath.row].cases ?? ""
        vc?.dth = array[indexPath.row].deaths ?? ""
        vc?.rcvrd = array[indexPath.row].recovered ?? ""
        vc?.last = array[indexPath.row].lastupdated ?? ""
        
        print(array[indexPath.row].lastupdated)
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func reloadButton(_ sender: Any) {
        getData()
    }
    
    @IBAction func infoButton(_ sender: Any) {
        let alert = UIAlertController(title: "Corona Tracker App Information ", message: "It's free app make for getting corona virus info and online test with realtime data with a free api . ", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ow, Thats Cool !", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty && searchText != " " && searchText != "  " else {array = details; return}
        
        array = details.filter ({ user -> Bool in
            return user.country!.contains(searchText)
        })
        
        isSearching = true
        tableView.reloadData()
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        isSearching = false
        array = details
        tableView.reloadData()
    }
    
    
}
extension FirstViewController{
    func getData() {
        
        guard let url = URL(string: "https://interactive-static.scmp.com/sheet/wuhan/viruscases.json") else { return }
        var request = URLRequest(url: url)
        
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //  request.addValue("", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        //request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let allData = data {
                do {
                    let responseModel = try? JSONDecoder().decode(Base.self, from: allData)
                    
                    DispatchQueue.main.async {
                        
                        //                    //    print(responseModel)
                        //                        self.array.append(responseModel?.entries)
                        //                        let a = responseModel?.entries.
                        //                        print(self.baseObj)
                        //                        let temp:Int = responseModel.payload?.count ?? 0
                        let temp = 1
                        
                        if(temp>0){
                            
                            for response in (responseModel?.entries)!{
                                
                                self.array.append(response)
                                
                                print(self.array)
                            }
                        }
                        
                        self.tableView.reloadData()
                    }
                    
                }
                catch {
                    print(error.localizedDescription)
                    return
                }
                
                
                
            }
            
        }.resume()
        
        
    }
}


