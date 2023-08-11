package demoCRUD.Service;

import demoCRUD.Entity.Donation;
import demoCRUD.Entity.UserDonation;

import java.util.List;
import java.util.Map;

public interface DonationService {
    public List<Donation> getDonations();
    public void saveDonation(Map<String, Object> params);
    public List<Donation>searchDonation(String searchQuery);
    public int deleteDonation(int idDonation);

    public boolean updateDonation(Map<String, Object> params);
    public Donation getDonationById(int donationId);
    public boolean statusUpdateDonation(Donation theDonation);
    public void acceptedADonation(String[]temp);

}
