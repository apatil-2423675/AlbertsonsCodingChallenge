//
//  HomeViewController.swift
//  AlbertsonsCodingChallenge
//
//  Created by 2423675 on 17/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var acronymTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emptyDataLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    lazy var viewModel: HomeViewModel = {
        let viewModel = HomeViewModel()
        return viewModel
    }()
    
    private var debouncer: Debouncer!
    
    private var textFieldValue = "" {
        didSet {
            debouncer.call()
        }
    }
    
    // MARK: - Class methods
    override func viewDidLoad() {
        super.viewDidLoad()

        observedAcromynData()
        setUpComponents()
    }
    
    // MARK: - Custom methods
    func setUpComponents() {
        activityIndicator.isHidden = true
        emptyDataLabel.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        debouncer = Debouncer.init(delay: 1, callback: triggerDebouncerCallback)
    }
    
    private func triggerDebouncerCallback() {
        if !textFieldValue.isEmpty {
            acronymTextField.isEnabled = false
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            emptyDataLabel.isHidden = true
            tableView.isHidden = true
            getAcromineData(sf: textFieldValue)
        }
    }
    
    func getAcromineData(sf: String) {
        viewModel.getAcromine(sf: sf, lf: "")
    }
    
    func observedAcromynData() {
        viewModel.completion = { [weak self] (acromineModel, error) in
            if let acromineModel, !acromineModel.isEmpty {
                DispatchQueue.main.async {
                    self?.updateUIAfterAPICall()
                    self?.tableView.isHidden = false
                    self?.tableView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                    self?.updateUIAfterAPICall()
                    self?.tableView.isHidden = true
                    
                    self?.emptyDataLabel.isHidden = false
                    self?.emptyDataLabel.text = error.message
                }
            }
        }
    }
    
    func updateUIAfterAPICall() {
        self.acronymTextField.isEnabled = true
        self.activityIndicator.stopAnimating()
        self.activityIndicator.hidesWhenStopped = true
    }
    
    // MARK: - IBOutlet actions
    @IBAction func textChanged(_ sender: Any) {
        textFieldValue = (sender as? UITextField)?.text ?? ""
    }
}

// MARK: - TableView data source and delegate methods

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.acromineModel.first?.lfs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AcronymsTableViewCell.self), for: indexPath) as? AcronymsTableViewCell else {
            return UITableViewCell()
        }
        
        if let data = viewModel.acromineModel.first?.lfs?[indexPath.row] {
            cell.setUpDataOnCell(data: data)
        }
        
        return cell
    }
}
