package demoCRUD.Service;

import demoCRUD.Dao.UserDonationDao;
import demoCRUD.Entity.Donation;
import demoCRUD.Entity.UserDonation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class UserDonationServiceImpl implements UserDonationService{
    @Autowired
    private UserDonationDao userDonationDao;
    @Override
    @Transactional
    public List<UserDonation> getListUserDonationByIdDonation(int idDonation){
        return userDonationDao.getListUserDonationByIdDonation(idDonation);
    }
    @Override
    @Transactional
    public List<Donation> getDonationsLimitFive(){

        return userDonationDao.getDonationsLimitFive();
    }

    @Override
    @Transactional
    public boolean saveUserDonation(UserDonation userDonation, int idDonation){
        return userDonationDao.saveUserDonation(userDonation,idDonation);
    }
    @Override
    @Transactional
    public void canceledADonation(int idUserDonation){

        userDonationDao.canceledADonation(idUserDonation);
    }
}
