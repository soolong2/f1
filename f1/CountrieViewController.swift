//
//  ViewController.swift
//  f1
//
//  Created by so on 2022/05/25.
//

import UIKit

class CountrieViewController: UIViewController {
    var countries: [Countries] = []
    @IBOutlet weak var countrieView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        do {
            self.countries = try jsonDecoder.decode([Countries].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        self.countrieView.reloadData()
    }
}
extension CountrieViewController: UITableViewDelegate, UITableViewDataSource {
    
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableViewCell", for: indexPath)
                as? CountriesTableViewCell
        else { return UITableViewCell()
        }
        let data = countries[indexPath.row]
        //if 모델에 뭐가 맑음이다 하면 cell.counImage.image = if a1 UIImage(named: flag_de)
        if data.asset_name == "de"{
            cell.countrieImage.image = UIImage(named: "flag_de")
            
        }else if data.asset_name == "kr"{
            cell.countrieImage.image = UIImage(named:  "flag_kr")
        }else if data.asset_name == "us"{
            cell.countrieImage.image = UIImage(named:  "flag_us")
        }else if data.asset_name == "fr"{
            cell.countrieImage.image = UIImage(named:  "flag_fr")
        }else if data.asset_name == "jp"{
            cell.countrieImage.image = UIImage(named:  "flag_jp")
        }else if data.asset_name == "it"{
            cell.countrieImage.image = UIImage(named:  "flag_it")
        }
            cell.countrieLabel.text = data.korean_name + "(\(data.asset_name))"//[countries.korean_name + "(\(countrie.asset_name))"
            
            return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "CityViewController")as? CityViewController else  {return}
        viewController.title = "\(countries[indexPath.row].korean_name)"
        viewController.cun = countries[indexPath.row].asset_name
        navigationController?.pushViewController(viewController, animated: true)
        print("왜안되는거야\(countries[indexPath.row])")
        
        
    }
    
}




