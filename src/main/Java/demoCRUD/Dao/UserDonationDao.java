package demoCRUD.Dao;

import demoCRUD.Entity.Donation;
import demoCRUD.Entity.UserDonation;

import java.util.List;

public interface UserDonationDao {
    public List<UserDonation> getListUserDonationByIdDonation(int idDonation);
    public List<Donation> getDonationsLimitFive();
    public boolean saveUserDonation(UserDonation userDonation, int idDonation);
    public void canceledADonation(int idUserDonation);

}
