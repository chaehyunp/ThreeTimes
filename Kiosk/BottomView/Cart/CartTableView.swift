//
//  CartTableView.swift
//  Kiosk
//
//  Created by 박진홍 on 11/26/24.
//

import UIKit

class CartTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var data: [CartData] = [] //추후 실제 데이터로 변경
    var cartUpdate: ((Int, String) -> Void)?
    
    init() {
        super.init(frame: .zero, style: .plain)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //데이터 소스
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkRowEmpty()
        return data.count
    }
    //데이터 소스 - 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as? CartTableViewCell else {
            fatalError("Could not dequeue CustomCell")
        }
        let productData = data[indexPath.row]
        cell.configure(with: productData)
        cell.rowTapped = { [weak self] action in
            self?.cartUpdate?(indexPath.row, action)
        }
        
        return cell
    }
    //행 추가 메서드
    func addProduct(_ product: CartData) {
        let newIndex = data.count//.count로 마지막 인덱스 +1의 인덱스를 지정
        data.append(product)//새로운 데이터 추가
        self.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .automatic)//행 추가
        DispatchQueue.main.async {
            if let cell = self.cellForRow(at: IndexPath(row: newIndex, section: 0)) as? CartTableViewCell{
                cell.configure(with: product)
            }
        }
        self.checkRowEmpty()//장바구니가 채워졌다면 문구 삭제
        
    }
    //테이블 뷰 비우기
    func emptyCart() {
        data.removeAll()
        self.reloadData()
        self.checkRowEmpty()
    }
//    행 삭제 메서드
    func removeProduct(at index: Int) {
        guard index >= 0 && index < data.count else { return }//인덱스가 유효한지 체크
        data.remove(at: index)//데이터 배열에서 삭제
        self.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)//행 삭제
        self.checkRowEmpty()//비어있는지 체크
    }
    //테이블뷰 셋업
    private func setupTableView() {
        layer.cornerRadius = 15
        layer.masksToBounds = true
        self.isScrollEnabled = false //스크롤 비활성화
        self.dataSource = self
        self.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        
    }
    //테이블이 비었을 때 배경에 레이블 띄움
    func checkRowEmpty() {
        if data.isEmpty {
            var emptyLabel: UILabel {
                let label = UILabel()
                label.text = NSLocalizedString("empty", comment: "")
                label.textAlignment = .center
                label.textColor = UIColor(named: "600")
                return label
            }
            self.backgroundView = emptyLabel
            self.separatorStyle = .none
            
        } else {
            self.backgroundView = nil
            
        }
    }
}
