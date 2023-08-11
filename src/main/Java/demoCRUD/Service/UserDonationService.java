package demoCRUD.Service;
import demoCRUD.Entity.Donation;
import demoCRUD.Entity.UserDonation;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public interface UserDonationService {
    public List<UserDonation> getListUserDonationByIdDonation(int idDonation);
    public List<Donation> getDonationsLimitFive();
    public boolean saveUserDonation(UserDonation userDonation, int idDonation);
    public void canceledADonation(int idUserDonation);
}
