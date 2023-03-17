//
//  HomeVC.swift
//  NEWZIA
//
//  Created by Abo Saleh on 17/03/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - IBOutlets.
    @IBOutlet weak var searchArticlesBar: UISearchBar!
    @IBOutlet weak var articlesTView: UITableView!
    
    // MARK: - Private Variables.
    private var articlesTViewItems = [ArticlesModel]()
    private var from_page = 1
    private var to_page = 5
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getArticles()
    }
    
    // MARK: - Private Functions.
    private func setupUI() {
        setupTableView()
    }
    private func setupTableView() {
        articlesTView.delegate = self
        articlesTView.dataSource = self
        articlesTView.registerTVCell(cellClass: ArticlesTViewCell.self)
    }
    // MARK: - IBActions.
    
}

// MARK: - UICollectionView Delegate & DataSource.
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesTViewItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = tableView.dequeueTVCell() as ArticlesTViewCell
        let item = articlesTViewItems[indexPath.row]
        articleCell.selectionStyle = .none
        articleCell.configureCell(with: item)
        
        return articleCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = articlesTViewItems[indexPath.row]
        let vc = UIStoryboard(name: Constants.StoryBoardNames.home, bundle: nil).instantiateViewController(withIdentifier: Constants.VCIdentifier.detailsArticleVC) as! DetailsArticlesVC
        
        vc.articleItem = item
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - APi.
extension HomeVC {
    func getArticles(page: Int = 1, isLoading: Bool = true) {
        let parameters = [
            "page": page,
            "q": "bitcoin"
        ] as [String : Any]
        
        NetworkManager.instance.request(Endpoints.everything, parameters: parameters, method: .get, type: [ArticlesModel].self, viewController: self, hasLoading: isLoading) { [self] (data) in
            success(data: data)
        }
    }
    
    private func success(data: BaseModel<[ArticlesModel]>?) {
        articlesTViewItems.append(contentsOf: data?.data ?? [])
        articlesTView.reloadData()
    }
}

