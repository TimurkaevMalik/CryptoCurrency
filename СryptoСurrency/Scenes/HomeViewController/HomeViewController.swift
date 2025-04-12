//
//  HomeViewController.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var vm: HomeViewModelProtocol
    
    private lazy var titleLabel = UILabel()
    private lazy var trendingLabel = UILabel()
    private lazy var affiliateProgramLabel = UILabel()
    private lazy var learnMoreButton = RoundedButton(title: "Learn more")
    
    private lazy var trendContainer = UIView()
    private lazy var cubeImageView = UIImageView()
    
    private lazy var menuButton: MenuButton = {
        MenuButton(actions: menuButtonActions)
    }()
    
    private lazy var sortingButton: MenuButton = {
        MenuButton(actions: filterButtonActions)
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CurrencyCell.self,
                           forCellReuseIdentifier: CurrencyCell.identifier)
        
        return tableView
    }()
    
    init(viewModel: HomeViewModelProtocol) {
        vm = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypPink
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        bindViewModel()
        updateCrypts()
        setupUI()
    }
    
    private func bindViewModel() {
        vm.onCryptsChange = { [weak self] in
            guard let self else { return }
            print(vm.crypts)
            tableView.reloadData()
        }
        
        vm.onFetchFailure = { error in
            ///TODO: call alert
            print(error)
        }
    }
    
    private func setupUI() {
        setupTitleLabel()
        setupMenuButton()
        setupTrendContainer()
        setupCubeImageView()
        setupAffiliateProgramLabel()
        setupLearnMoreButton()
        setupTrendingLabel()
        setupFilterButton()
        setupTableView()
        
        setViewsPositionZ()
    }
    
    private func setViewsPositionZ() {
        view.sendSubviewToBack(cubeImageView)
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "Home"
        titleLabel.font = .title
        titleLabel.textColor = .ypWhite
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
    
    private func setupTrendingLabel() {
        trendingLabel.text = "Trending"
        trendingLabel.font = .affiliateProgram
        trendingLabel.textColor = .ypBlackEclipse
        
        trendingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trendingLabel)
        
        NSLayoutConstraint.activate([
            trendingLabel.heightAnchor.constraint(equalToConstant: 30),
            trendingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            trendingLabel.topAnchor.constraint(equalTo: trendContainer.topAnchor, constant: 24)
        ])
    }
    
    private func setupAffiliateProgramLabel() {
        affiliateProgramLabel.text = "Affiliate program"
        affiliateProgramLabel.font = .affiliateProgram
        affiliateProgramLabel.textColor = .ypWhite
        
        affiliateProgramLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(affiliateProgramLabel)
        
        NSLayoutConstraint.activate([
            affiliateProgramLabel.topAnchor.constraint(equalTo: cubeImageView.topAnchor, constant: 25),
            affiliateProgramLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            affiliateProgramLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupMenuButton() {
        view.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.defaultMargin),
            menuButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    private func setupFilterButton() {
        sortingButton.backgroundColor = .clear
        sortingButton.setImage(.sort, for: .normal)
        sortingButton.layer.masksToBounds = false
        
        view.addSubview(sortingButton)
        
        let size: CGFloat = 24
        
        NSLayoutConstraint.activate([
            sortingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.defaultMargin),
            sortingButton.centerYAnchor.constraint(equalTo: trendingLabel.centerYAnchor),
            sortingButton.heightAnchor.constraint(equalToConstant: size),
            sortingButton.widthAnchor.constraint(equalToConstant: size)
        ])
    }
    
    private func setupLearnMoreButton() {
        view.addSubview(learnMoreButton)
        
        NSLayoutConstraint.activate([
            learnMoreButton.topAnchor.constraint(equalTo: affiliateProgramLabel.bottomAnchor, constant: 12),
            learnMoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            learnMoreButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setupTrendContainer() {
        trendContainer.backgroundColor = .ypWhiteGhost
        
        trendContainer.layer.cornerRadius = 40
        trendContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        trendContainer.layer.masksToBounds = true
        
        view.addSubview(trendContainer)
        trendContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trendContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 258),
            trendContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            trendContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trendContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupCubeImageView() {
        cubeImageView.image = .cube
        view.addSubview(cubeImageView)
        cubeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cubeImageView.topAnchor.constraint(equalTo: trendContainer.topAnchor, constant: -157),
            cubeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            cubeImageView.heightAnchor.constraint(equalToConstant: 242),
        ])
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: trendContainer.topAnchor, constant: 70),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.defaultMargin)
        ])
    }
    
    private func updateCrypts() {
        vm.updateCrypts()
    }
}

private extension HomeViewController {
    var menuButtonActions: [UIAction] {
        let logoutAction = UIAction(title: "Выйти",
                                    image: .bin) { [weak self] _ in
            guard let self else { return }
            
            AuthService.shared.logout()
            self.showAuthViewController()
        }
        
        let updateAction = UIAction(title: "Обновить",
                                    image: .rocket) { [weak self] _ in
            guard let self else { return }
            self.updateCrypts()
        }
        
        return [logoutAction, updateAction]
    }
    
    var filterButtonActions: [UIAction] {
        let ascendingAction = UIAction(title: "По возрастинию", image: .chevronUp) { [weak self] _ in
            guard let self else { return }
            
            vm.sortAscending()
        }
        
        let descendingAction = UIAction(title: "По убыванию", image: .chevronDown) { [weak self] _ in
            guard let self else { return }
            
            vm.sortDescending()
        }
        
        return [ascendingAction, descendingAction]
    }
    
    func showAuthViewController() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            
            let viewModel = AuthViewModel(authService: AuthService.shared)
            window.rootViewController = AuthViewController(viewModel: viewModel)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return vm.crypts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CurrencyCell.identifier,
            for: indexPath) as? CurrencyCell else {
            return UITableViewCell()
        }
        
        cell.configureWith(vm.crypts[indexPath.row])
       
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
