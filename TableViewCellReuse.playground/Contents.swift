//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class ReuseCell {
    var visableCells = [IndexPath:UITableViewCell]()
    var reusableCells = [UITableViewCell]()

    var i = 0
    
    func dequeueReuseable(indexPath:IndexPath) -> UITableViewCell{
        if reusableCells.isEmpty {
            let cell = UITableViewCell()
            cell.textLabel?.text = "\(i)"
            i+=1
            reusableCells.append(cell)
        }
        let cell = reusableCells.removeLast()
        return cell
        
    }
    

    func inqueue(cell : UITableViewCell){
        reusableCells.append(cell)
    }
    
}

class MyViewController : UIViewController  , UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reuseCell.dequeueReuseable(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        reuseCell.inqueue(cell: cell)
        print(cell.textLabel?.text)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //reuseCell.inqueue(visableCellsIndexPath: tableView.visibleCells)
    }
    

    let tableView = UITableView()
    let reuseCell = ReuseCell()
    
    override func loadView() {
        self.view = tableView
    }
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self

    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
