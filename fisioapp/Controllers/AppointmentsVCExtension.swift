import UIKit

extension AppoitmentsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selected = appointments[indexPath.row]
        
        let appointment = AppoitmentViewController()
        appointment.appointment = selected
        
        navigationController?.pushViewController(appointment, animated: true)
        
        
    }
    
    
}
