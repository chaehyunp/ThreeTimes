//
//  CartTableView.swift
//  Kiosk
//
//  Created by 박진홍 on 11/26/24.
//

import UIKit

class CartTableView: UITableView, UITableViewDataSource {
    var data: [String] = [] //추후 실제 데이터로 변경
    init() {
        super.init(frame: .zero, style: .plain)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //테이블뷰 셋업
    private func setupTableView() {
        self.dataSource = self
        self.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
    }
    //데이터 소스 / 비었을 때 처리
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data.isEmpty {
            var emptyLabel: UILabel {
                let label = UILabel()
                label.text = "장바구니가 비었습니다."
                label.textAlignment = .center
                label.textColor = .gray
                return label
            }
            tableView.backgroundView = emptyLabel
            tableView.separatorStyle = .none
            return 0
        } else {
            tableView.backgroundView = nil
            return data.count
        }
        
    }
    //데이터 소스 - 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as? CartTableViewCell else {
            fatalError("Could not dequeue CustomCell")
        }
        let productData = data[indexPath.row]
        cell.configure(with: productData)
        return cell
    }
}
