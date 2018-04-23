import UIKit

extension AppoitmentsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appointmentsForCV.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let appointmentToShow = appointmentsForCV[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appoitmentsCellID, for: indexPath) as! AppoitmentsViewCell
        
        cell.backgroundColor = UIColor.orange
        cell.nameLabel.text = appointmentToShow.customer
        cell.commentLabel.text = appointmentToShow.address
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selected = appointmentsForCV[indexPath.row]
        
        let appointment = AppoitmentViewController()
        appointment.appointment = selected
        print(selected.id)
        print(selected.isConfirmed)
        print(selected.isCancelled)
        
        navigationController?.pushViewController(appointment, animated: true)
    }
    
    
    
    /******** appointment mapper ********/
    func appointmentMapper(appointment: AppointmentDomain) -> AppointmentModel{
        
        let customerName = appointment.customer.name + " " + appointment.customer.lastName
        let appointmentModel = AppointmentModel(id: appointment.id,
                                                customer: customerName,
                                                address: appointment.address,
                                                date: appointment.date,
                                                isConfirmed: appointment.isConfirmed,
                                                isCancelled: appointment.isCancelled,
                                                price: Int(appointment.service.price),
                                                lat: appointment.latitude,
                                                long: appointment.longitude)
        
        return appointmentModel
    }
    
    
}
