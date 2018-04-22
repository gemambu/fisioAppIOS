import UIKit

extension AppointmentsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selected = appointments[indexPath.row]
        
        let appointment = AppointmentViewController()
        appointment.appointment = selected
        
        navigationController?.pushViewController(appointment, animated: true)
        
        
    }
    
    
}
