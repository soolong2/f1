//
//  ThirdViewController.swift
//  f1
//
//  Created by so on 2022/05/26.
//

import UIKit

class WeatherViewController: UIViewController {
    var model : City?
    
    @IBOutlet weak var weatherimage: UIImageView!
    @IBOutlet weak var weatherKoreaName: UILabel!
    @IBOutlet weak var weatherProbabillity: UILabel!
    @IBOutlet weak var weatherTemperature: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if model?.state == 10 {
            weatherimage.image = UIImage(named: "sunny")
            weatherKoreaName.text = "맑음"
        } else if
            model?.state == 11 {
            weatherimage.image = UIImage(named: "cloudy")
            weatherKoreaName.text = "흐림"
            } else if
            model?.state == 12 {
            weatherimage.image = UIImage(named: "rainy")
            weatherKoreaName.text = "비"
        } else if
            model?.state == 13 {
            weatherimage.image = UIImage(named: "snowy")
            weatherKoreaName.text = "눈"
        }
        
        if let rainfallProbability = model?.rainfall_probability {
            weatherProbabillity.text = "강수확률 \(rainfallProbability)%"
        }
        if let celsius = model?.celsius {
            weatherTemperature.text = "썹씨\(celsius)  /  화씨\(round((celsius * 9/5 + 32) * 10) / 10)"
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
///       현상황 문제점
//        1. 세컨뷰에서 셀들이 보이지 않는다
//        2. 세컨뷰는 각 국가별 도시로 나타내는데 세컨뷰가 하나밖에없다.
//
//
//        나름의 해결방안 = 나의생각
//        1.세컨뷰컨트롤러에서 뷰윌어페어안에 레이블.text = 스트럭트값을 넣어준다. 이게 맞다면 1-1번이 선행되어야하겠지
//        1-1.에셋의 저장값들을 한스위프트파일안에서 만들어준다.
//
//       2. if data.asset_name == "kr"{여기서 나라이름,온도,강수확률을 다 하나하나해야하는지? or if data.asset_name ==            "kr" 맞다면 citys만 넣어서 전체적으로 변경이 가능한건지??}


// Do any additional setup after loading the view.



