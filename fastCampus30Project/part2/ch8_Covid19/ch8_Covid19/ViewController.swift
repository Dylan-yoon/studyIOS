//
//  ViewController.swift
//  ch8_Covid19
//
//  Created by 윤병희 on 2021/11/22.
//

import UIKit

import Alamofire
import Charts       //파이차트 사용하기위해 인포트한다

class ViewController: UIViewController {

    @IBOutlet weak var totalCaseLabel: UILabel!
    
    @IBOutlet weak var newCaseLabel: UILabel!
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCovidOverview(completionHandler: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(result):
                self.configureStackView(koreaCovidOverview: result.korea)
                
            case let .failure(error) :
                debugPrint("error \(error)")
            }
        })
    }
    
    //파이차트에 표시하는 메서드
    func makeCovidOverviewList(
    CityCovidOverview: CityCovidOverview
    ) -> [CovidOverview] {
     return [
        CityCovidOverview.seoul,
        CityCovidOverview.busan,
        CityCovidOverview.daegu,
        CityCovidOverview.incheon,
        CityCovidOverview.gwangju,
        CityCovidOverview.daejeon,
        CityCovidOverview.ulsan,
        CityCovidOverview.sejong,
        CityCovidOverview.gyeonggi,
        CityCovidOverview.gangwon,
        CityCovidOverview.chungbuk,
        CityCovidOverview.chungnam,
        CityCovidOverview.jeonbuk,
        CityCovidOverview.jeonnam,
        CityCovidOverview.gyeongbuk,
        CityCovidOverview.gyeongnam,
        CityCovidOverview.jeju,
     ]
    }
    
    func configureChartView(covidOverviewList : [CovidOverview]) {
        let entries = covidOverviewList.compactMap{ }[weak self] overview -> PieChartDataEntry? in
        guard let self = self else { return nil }
        return PieChartDataEntry(
            value: self.removeFormatString(string: overview.newCase),
            label: overview.countryName,
            data: overview)
    }
    
    func removeFormatString(string : String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    
    func configureStackView(koreaCovidOverview: CovidOverview) {
        self.totalCaseLabel.text = "\(koreaCovidOverview.totalCase)명"
        self.newCaseLabel.text = "\(koreaCovidOverview.newCase)명"
    }
    
    func fetchCovidOverview(
        completionHandler: @escaping (Result<CityCovidOverview, Error>) -> Void
    ) {
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = [
            "serviceKey": "ILF5RP9wehlNmogHWU2bXkYCrGAVQETzf"
        ]
        AF.request(url, method: .get, parameters: param)
            .responseData(completionHandler: { response in
                switch response.result {
                case let .success(data) :
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                    
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            })
    }
}

