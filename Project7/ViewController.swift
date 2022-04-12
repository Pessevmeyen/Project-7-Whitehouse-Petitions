//
//  ViewController.swift
//  Project7
//
//  Created by Furkan Eruçar on 8.04.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]() // We want to make an array of our Petition object. So, we changed [String] to [Petition].

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // It's now time to parse some JSON, which means to process it and examine its contents. We're going to start by updating the viewDidLoad() method for ViewController so that it downloads the data from the Whitehouse petitions server, converts it to a Swift Data object, then tries to convert it to an array of Petition instances.
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            //urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100" // Bu siteler biz kullanana kadar içeriği değişmiş veya kapanmış olabilir.
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json" // urlString points either to the Whitehouse.gov server or to my cached copy of the same data, accessing the available petitions.
        } else {
            //urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) { // We use if let to make sure the URL is valid, rather than force unwrapping it. Later on you can return to this to add more URLs, so it's good play it safe.
            if let data = try? Data(contentsOf: url) { // Data and String have quite a few things in common. You already saw that String can be created using contentsOf to load data from disk, and Data has exactly the same initializer. // We create a new Data object using its contentsOf method. This returns the content from a URL, but it might throw an error (i.e., if the internet connection was down) so we need to use try?.
                parse(json: data) // If the Data object was created successfully, we reach the "parse" line.
                return
                
            }
            
        }
        
        showError()
        
        
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        
        let decoder = JSONDecoder() // JSON – short for JavaScript Object Notation – is a way of describing data. It creates an instance of JSONDecoder, which is dedicated to converting between JSON and Codable objects.
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) { // It then calls the decode() method on that decoder, asking it to convert our json data into a Petitions object. This is a throwing call, so we use try? to check whether it worked. Petitions.self, which is Swift’s way of referring to the Petitions type itself rather than an instance of it. That is, we’re not saying “create a new one”, but instead specifying it as a parameter to the decoding so JSONDecoder knows what to convert the JSON too.
            petitions = jsonPetitions.results // If the JSON was converted successfully, assign the results array to our petitions property then reload the table view.
            tableView.reloadData()
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) // identifier gördüğümüz zaman storyboardda adını vermiş olduğumuz id'leri kullanıcaz ya da onun gibi.
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title // Ana text'imiz
        cell.detailTextLabel?.text = petition.body // subtitle'ımız olacak
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController() // Burda direk bağladık çünkü detailviewcontroller için ayrı bi storyboard oluşturmadık.
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }


}

