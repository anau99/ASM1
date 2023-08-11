package demoCRUD.Dao;
import demoCRUD.Entity.Donation;
import demoCRUD.Entity.UserDonation;

import java.util.List;
import java.util.Map;

public interface DonationDao {
   public List<Donation> getDonations();

    public void saveDonation(Map<String, Object> var1);

    public List<Donation> searchDonation(int searchTypeDonation,String querySearch);
    public int deleteDonation(int idDonation);
    public boolean updateDonation(Map<String, Object> params);
    public Donation getDonationById(int donationId);
    public boolean  statusUpdateDonation(Donation theDonation);
    public void acceptedADonation(String[]temp);
}
