import UIKit

extension AppointmentsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /******** CollectionView DataSource ********/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appointmentsForCV.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let appointmentToShow = appointmentsForCV[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appointmentsCellID, for: indexPath) as! AppointmentsViewCell
        
        cell.backgroundColor = UIColor.orange
        let customerName = appointmentToShow.customer.name.capitalized + " " + appointmentToShow.customer.lastName.capitalized
        cell.nameLabel.text = customerName
        cell.commentLabel.text = appointmentToShow.address
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selected = appointmentsForCV[indexPath.row]
        
        let appointment = AppointmentViewController()
        appointment.appointment = selected
        print(selected.id)
        print(selected.isConfirmed)
        print(selected.isCancelled)
        
        navigationController?.pushViewController(appointment, animated: true)
    }
    
    
    
    /******** CollectionView Initializer + RefreshControl ********/
    func initializeCollectionView() {
        
        let frame = CGRect(x: 0, y: self.view.frame.height/2, width: self.view.frame.width, height: self.view.frame.height)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: frame.width, height: 200)
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.refreshControl = self.refreshControl
        
        refreshControl.addTarget(self, action: #selector(refreshCVData(_:)), for: .valueChanged)
        
        collectionView!.register(UINib(nibName: "AppointmentsViewCell", bundle: nil), forCellWithReuseIdentifier: appointmentsCellID)
        collectionView.backgroundColor = UIColor.white
    }
    
    @objc func refreshCVData(_ sender: Any){
        self.appointmentsForCV.removeAll()
        getAppointmentsForDate(date: selectedDate)
        self.refreshControl.endRefreshing()
    }
}
