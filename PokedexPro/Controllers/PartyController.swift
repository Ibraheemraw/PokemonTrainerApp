import UIKit

class PartyController: UIViewController {
    // MARK: - Outlets and Properties

    @IBOutlet weak var tableView: UITableView!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }

    // MARK: - Actions and Methods
    private func callMethods(){
        tableView.dataSource = self
        tableView.delegate = self
    }
}
extension PartyController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension PartyController: UITableViewDelegate{
    
}
