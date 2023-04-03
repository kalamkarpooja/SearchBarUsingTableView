//
//  ViewController.swift
//  SearchBarController
//
//  Created by Mac on 02/04/23.
//

import UIKit
struct DataModel{
    var fname : String = ""
    var lname : String = ""
    var image : String = ""
}
class ViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    var arrData = [DataModel]()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        searchBarSetup()
    }
    private func DataModelSetup(){
        arrData = [
        DataModel(fname: "Pooja", lname: "kalamkar",image: "login"),
        DataModel(fname: "Kiran", lname: "kalamkar",image: "login"),
        DataModel(fname: "Pooja", lname: "Rao",image: "login"),
        DataModel(fname: "Akshay", lname: "Vyawahare",image: "login"),
        DataModel(fname: "Pooja", lname: "patil",image: "login"),
        DataModel(fname: "Sunil", lname: "pawar",image: "login"),
        DataModel(fname: "Mayuri", lname: "Kale",image: "login"),
        DataModel(fname: "Akash", lname: "kalamkar",image: "login"),
        DataModel(fname: "Akanksha", lname: "Pund",image: "login"),
        DataModel(fname: "Pandurang", lname: "kalamkar",image: "login"),
        DataModel(fname: "Pranita", lname: "Pund",image: "login"),
        DataModel(fname: "Rahul", lname: "Bharad",image: "login"),
        DataModel(fname: "Rutuja", lname: "Kale",image: "login"),
        DataModel(fname: "Arun", lname: "khan",image: "login")
        ]
    }
    private func searchBarSetup(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
}
extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        if searchText == ""{
            DataModelSetup()
        }else{
            arrData = arrData.filter{
                $0.fname.contains(searchText)
                }
        }
        tableView.reloadData()
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrData[indexPath.row].fname
        cell.detailTextLabel?.text = arrData[indexPath.row].lname
        cell.imageView?.image = UIImage(named: arrData[indexPath.row].image)
        cell.imageView?.contentMode = .scaleAspectFit
        cell.textLabel?.textColor = .systemBlue
        cell.textLabel?.font = .boldSystemFont(ofSize: 18)
        cell.detailTextLabel?.textColor = .black
        cell.detailTextLabel?.font = .systemFont(ofSize: 16)
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 2
        cell.layer.borderColor = .init(genericCMYKCyan: 2, magenta: 2, yellow: 1, black: 2, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
