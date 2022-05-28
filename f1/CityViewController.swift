//
//  SecondViewController.swift
//  f1
//
//  Created by so on 2022/05/26.
//

import UIKit

class CityViewController: UIViewController {
    var citys : [City] = []
    var cun: String?
    @IBOutlet weak var citysVIewController: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.citysVIewController.reloadData()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let cun = cun, let dataAsset: NSDataAsset = NSDataAsset(name: cun) else {
            return
        }
        do {
            self.citys = try jsonDecoder.decode([City].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
}
extension CityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.citys.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityViewCell", for: indexPath) as? CityViewCell else {
            return UITableViewCell()
            }
        
        let data = citys[indexPath.row]
        
        cell.cityName.text = data.city_name
        //여기서도 썹시가 10 이상일때 색상을
        cell.o1.text = "썹씨\(data.celsius) / 화씨\(round((data.celsius * 9/5 + 32) * 10) / 10)"
       //강수확률이 60이상일때 텍스트필트의 색상을 바꾸고 싶다.
        if data.rainfall_probability == 10 {
            cell.o2.text = "강수확률 \(data.rainfall_probability)%"
        } else if data.rainfall_probability == 20 {
            cell.o2.text = "강수확률 \(data.rainfall_probability)%"
        } else if data.rainfall_probability == 30 {
            cell.o2.text = "강수확률 \(data.rainfall_probability)%"
        } else if data.rainfall_probability == 40 {
            cell.o2.text = "강수확률 \(data.rainfall_probability)%"
        } else if data.rainfall_probability == 50 {
            cell.o2.text = "강수확률 \(data.rainfall_probability)%"
        } else if data.rainfall_probability == 60 {
            cell.o2.text = "강수확률 \(data.rainfall_probability)%"
        } else if data.rainfall_probability == 70 {
            cell.o2.text = "강수확률 \(data.rainfall_probability)%"
        } else if data.rainfall_probability == 80 {
            cell.o2.text = "강수확률 \(data.rainfall_probability)%"
        } else if data.rainfall_probability == 90 {
            cell.o2.text = "강수확률 \(data.rainfall_probability)%"
        }
        
        
        if data.state == 10 {
            cell.seconImage.image = UIImage(named: "sunny")
        } else if data.state == 11 {
            cell.seconImage.image = UIImage(named: "cloudy")
        } else if data.state == 12 {
            cell.seconImage.image = UIImage(named: "rainy")
        } else if data.state == 13 {
            cell.seconImage.image = UIImage(named: "snowy")
        }
        return cell
    }

    //3번쨰 뷰로 넘어가라
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "WeatherViewController")as? WeatherViewController else {return}
        viewController.title = "\(citys[indexPath.row].city_name)"
        viewController.model = citys[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
        print("😅")
        //
    }
}

