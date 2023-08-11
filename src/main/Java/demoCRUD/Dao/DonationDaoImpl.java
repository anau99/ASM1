package demoCRUD.Dao;
import demoCRUD.Entity.Donation;
import demoCRUD.Entity.UserDonation;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Repository
public class DonationDaoImpl implements DonationDao {
    //Tu động nào sessionFactory vào bean
    @Autowired
    private SessionFactory sessionFactory;

    public DonationDaoImpl() {
    }

    /*
     * Hàm này để lấy tất cả các donation từ DB bởi session factory
     *
     * */
    @Override
    public List<Donation> getDonations() {
        Session currentSession = this.sessionFactory.getCurrentSession();
        Query<Donation> theQuery = currentSession.createQuery("from Donation where visited = 0", Donation.class);
        return theQuery.getResultList();
    }

    @Override
    public void saveDonation(Map<String, Object> params) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        Donation donation = new Donation();
        donation.setCode(params.get("code").toString());
        donation.setName(params.get("name").toString());
        donation.setStartDate(params.get("startDate").toString());
        donation.setEndDate(params.get("endDate").toString());
        donation.setOrganizationName(params.get("organizationName").toString());
        donation.setPhoneNumber(params.get("phoneNumber").toString());
        donation.setDescription(params.get("description").toString());
        //Initial visited = 0
        donation.setVisited(0);
        currentSession.save(donation);
    }

    @Override
    public List<Donation> searchDonation(int searchTypeDonation,String searchQuery){
        Session currentSession = this.sessionFactory.getCurrentSession();
        Query<Donation>theQuery = currentSession.createQuery(
                "from Donation where (status =: searchTypeDonation" +
                        " OR phone_number LIKE :searchQuery " +
                        "OR  organization_name LIKE :searchQuery OR " +
                        "code LIKE :searchQuery) AND visited = 0");
        theQuery.setParameter("searchTypeDonation", searchTypeDonation);
        theQuery.setParameter("searchQuery", searchQuery+  "%");
        return theQuery.getResultList();

    }

    @Override
    public int deleteDonation(int idDonation){
        Session currentSession = this.sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("UPDATE Donation SET visited = 1 WHERE id = :idDonation AND status = 0");
        theQuery.setParameter("idDonation", idDonation);
        int rowsAffected = theQuery.executeUpdate();
        return rowsAffected;

    }
    @Override
    public boolean updateDonation(Map<String, Object> params){
        Session currentSession = this.sessionFactory.openSession();
        Transaction transaction = null;
        boolean success = false;

        try {
            transaction = currentSession.beginTransaction();
            String sql = "UPDATE donation SET start_date = :startDate, " +
                    "end_date = :endDate, code = :code, " +
                    "name = :name, " +
                    "organization_name = :organizationName, " +
                    "phone_number = :phoneNumber, " +
                    "description = :description " +
                    "WHERE id = :donationId AND status <3";
            Query query = currentSession.createSQLQuery(sql);
            query.setParameter("startDate", params.get("startDate"));
            query.setParameter("endDate", params.get("endDate"));
            query.setParameter("code", params.get("code"));
            query.setParameter("name", params.get("name"));
            query.setParameter("organizationName", params.get("organizationName"));
            query.setParameter("phoneNumber", params.get("phoneNumber"));
            query.setParameter("description", params.get("description"));
            query.setParameter("donationId",Integer.parseInt(params.get("donationId").toString()));

            int rowsAffected = query.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            currentSession.close();
        }

        return success;

    }
    @Override
    public Donation getDonationById(int donationId){
        Session currentSession = this.sessionFactory.getCurrentSession();
        Query<Donation> theQueryDonation = currentSession.createQuery("from Donation where id = :donationId", Donation.class);
        theQueryDonation.setParameter("donationId", donationId);
        Donation theDonationById = theQueryDonation.getSingleResult();
        Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation where donation_id = :donationId",
                UserDonation.class);
        theQuery.setParameter("donationId",donationId);
        List<UserDonation>userDonations = theQuery.getResultList();
        theDonationById.setUserDonations(userDonations);
        return theDonationById;
    }

    @Override
    public boolean statusUpdateDonation(Donation theDonation){
        Session currentSession = this.sessionFactory.getCurrentSession();
        int idDonation = theDonation.getId();
        int status = theDonation.getStatus();
        Query theQuery = null;
        if(status>=0 && status <3){
            status++;
            theQuery = currentSession.createQuery("UPDATE Donation SET status = :status WHERE id = :idDonation");
        }
        theQuery.setParameter("idDonation", idDonation);
        theQuery.setParameter("status",status);
        int rowsAffected = theQuery.executeUpdate();
        return rowsAffected==1;
    }

    //value="${donation.id}-${userDonation.status}-${userDonation.id}-${userDonation.money}">
    @Override
    public void acceptedADonation(String[] temp) {
        Session currentSession = sessionFactory.getCurrentSession();

        int idUserDonation = Integer.parseInt(temp[2]);
        Query query = currentSession.createQuery("UPDATE UserDonation SET status = 1 WHERE id = :idUserDonation");
        query.setParameter("idUserDonation", idUserDonation);
        query.executeUpdate();

        int donationId = Integer.parseInt(temp[0]);
        int userDonationMoney = Integer.parseInt(temp[3]);
        Query theQuery = currentSession.createQuery("UPDATE Donation SET money = money + :userDonationMoney WHERE id = :donationId");
        theQuery.setParameter("userDonationMoney", userDonationMoney);
        theQuery.setParameter("donationId", donationId);
        theQuery.executeUpdate();
    }
}
