package demoCRUD.Service;
import demoCRUD.Dao.DonationDao;
import demoCRUD.Entity.Donation;
import demoCRUD.Entity.UserDonation;
import demoCRUD.Validator.ValidatorDonation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class DonationServiceImpl implements DonationService {
    @Autowired
    private DonationDao donationDao;
    @Override
    @Transactional
    /*
     * Hàm này để lấy tất cả các donation từ DB
     *
     * */
    public List<Donation> getDonations(){
        List<Donation>list = new ArrayList<Donation>();
        list = donationDao.getDonations();
        return list;
    }
    @Override
    @Transactional
    public void saveDonation(Map<String, Object> params){
        donationDao.saveDonation(params);
    }

    @Override
    @Transactional
    public List<Donation>searchDonation(String searchQuery){
        ValidatorDonation validatorStatusDonation = new ValidatorDonation();
        return donationDao.searchDonation(validatorStatusDonation.searchTypeDonation(searchQuery),searchQuery);
    }

    @Override
    @Transactional
    public int deleteDonation(int idDonation){
        return donationDao.deleteDonation(idDonation);
    }
    @Override
    @Transactional
    public boolean updateDonation(Map<String, Object> params){
        return donationDao.updateDonation(params);
    }

    @Override
    @Transactional
    public Donation getDonationById(int donationId){
        return donationDao.getDonationById(donationId);
    }

    @Override
    @Transactional
    public boolean statusUpdateDonation(Donation theDonation){
        return donationDao.statusUpdateDonation(theDonation);
    }
    @Override
    @Transactional
    public void acceptedADonation(String[]temp){
        donationDao.acceptedADonation(temp);
    }


}
