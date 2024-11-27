//
//  CartTableView.swift
//  Kiosk
//
//  Created by 박진홍 on 11/26/24.
//

import UIKit

class CartTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
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
        self.isScrollEnabled = false //스크롤 비활성화
        self.dataSource = self
        self.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
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
        return cell
    }
    //행 추가 메서드
    func addProduct(_ product: String) {
        let newIndex = data.count//.count로 마지막 인덱스 +1의 인덱스를 지정
        data.append(product)//새로운 데이터 추가
        self.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .automatic)//행 추가
        self.checkRowEmpty()//장바구니가 채워졌다면 문구 삭제
    }
    //행 삭제 메서드
    func removeProduct(at index: Int) {
        guard index >= 0 && index < data.count else { return }//인덱스가 유효한지 체크
        data.remove(at: index)//데이터 배열에서 삭제
        self.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)//행 삭제
        self.checkRowEmpty()//비어있는지 체크
    }
    //테이블이 비었을 때의 메시지 처리
    private func checkRowEmpty() {
        if data.isEmpty {
            var emptyLabel: UILabel {
                let label = UILabel()
                label.text = "장바구니가 비었습니다."
                label.textAlignment = .center
                label.textColor = .gray
                return label
            }
            self.backgroundView = emptyLabel
            self.separatorStyle = .none
            
        } else {
            self.backgroundView = nil
            
        }
    }
}
