
import UIKit

class CharacterViewController: UIViewController {
    
    private var character: [Character] = []
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "DISNEY"
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //mudar a de cima
    private func configureView(){
        view.backgroundColor = .init(red: 163/255, green: 117/255, blue: 198/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        addViewsInHierarchy()
        setupConstraints()
        fetchCharacterResult()
        configureView()
        
    }
    
    private func addViewsInHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    
    private func fetchCharacterResult() {
            let url = URL(string: "https://api.disneyapi.dev/character")!

            let request = URLRequest(url: url)

            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                if error != nil { return  }

                guard let charactersData = data else { return }
                

                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                guard let remoteCharacter = try? decoder.decode(CharacterResult.self, from: charactersData) else{ return }
                
                

                self.character = remoteCharacter.data
                
                

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }

            task.resume()
        }
    
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
extension CharacterViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = CharacterCell()
            let character = character[indexPath.row]
            cell.configure(character: character)
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            character.count
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
            let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
            detailViewController.character = character[indexPath.row]
            navigationController?.pushViewController(detailViewController, animated: true)
        }
        
        
    }
