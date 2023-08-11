package demoCRUD.Dao;
import demoCRUD.Entity.Donation;
import demoCRUD.Entity.UserDonation;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Repository
public class UserDonationDaoImpl implements UserDonationDao{
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<UserDonation> getListUserDonationByIdDonation(int idDonation){
        Session currentSession = sessionFactory.getCurrentSession();
        Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation where donation_id = :idDonation",
                UserDonation.class);
        theQuery.setParameter("idDonation",idDonation);
        List<UserDonation>userDonations = theQuery.getResultList();
        if(userDonations.isEmpty()) return null;
        return userDonations;

    }
    @Override
    public List<Donation> getDonationsLimitFive(){
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Donation> theQuery = currentSession.createQuery("FROM Donation Where visited = 0",
                Donation.class);
        //theQuery.setMaxResults(5);
       // theQuery.setParameter("idDonation",idDonation);
        List<Donation>donations = theQuery.getResultList();
        if(donations.isEmpty()) return null;
        return donations;
    }

    @Override
    public boolean saveUserDonation(UserDonation userDonation, int idDonation){
        Session currentSession = sessionFactory.getCurrentSession();
        String textMessage = userDonation.getTest().trim();
        //Set text message
        userDonation.setTest(textMessage);
        //set donation id
        Donation donation = new Donation();
        donation.setId(idDonation);
        userDonation.setDonation(donation);
        //set CurrentDate
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(currentDate);
        userDonation.setCreated(formattedDate);
        try {
            currentSession.save(userDonation);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void canceledADonation(int idUserDonation){
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("UPDATE UserDonation SET status = 2 WHERE id = :idUserDonation");
        query.setParameter("idUserDonation", idUserDonation);
        query.executeUpdate();
    }

}
