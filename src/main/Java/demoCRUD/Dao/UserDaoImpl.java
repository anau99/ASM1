package demoCRUD.Dao;
import demoCRUD.Entity.Role;
import demoCRUD.Entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<User> getUsers(){
        //get the current session
        Session currentSession =sessionFactory.getCurrentSession();
        Query<User> theQuery =currentSession.createQuery("from User",User.class);
        List<User>users = theQuery.getResultList();
        return users;
    }
    @Override
    public void saveUser(@RequestParam Map<String, Object> params) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        User user = new User();
        user.setFullName(params.get("fullName").toString());
        user.setEmail(params.get("email").toString());
        user.setPhoneNumber(params.get("phoneNumber").toString());
        user.setAddress(params.get("address").toString());
        user.setUserName(params.get("userName").toString());
        user.setPassword(params.get("password").toString());
        Role role = new Role();
        role.setId(Integer.parseInt(params.get("idRole").toString()));
        user.setRole(role);
        currentSession.save(user);
    }
    @Override
    public boolean userNameOrPasswordAreExisted(@RequestParam Map<String, Object> params) {
        Session curentSession = this.sessionFactory.getCurrentSession();
        Query<User> theQuery = curentSession.createQuery("from User Where user_name =: username Or password =: password");
        theQuery.setParameter("username", params.get("userName").toString());
        theQuery.setParameter("password", params.get("password").toString());
        List<User> users = theQuery.getResultList();
        return users.size() > 0;
    }

    @Override
    public List<User> searchUsers(String searchQuery) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        Query<User> userQuery = currentSession.createQuery("from User Where phone_number LIKE :searchQuery OR email LIKE :searchQuery");
        userQuery.setParameter("searchQuery", searchQuery + "%");
        List<User> users = userQuery.getResultList();
        return users;
    }

   @Override

    public void accessPermissions(String actionQuery, String idUserQuery) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        int status = actionQuery.equals("lock") ? 0 : 1;
        int idUser = Integer.parseInt(idUserQuery);
        String hql = "UPDATE User SET status = :status WHERE id = :idUser";
        Query query = currentSession.createQuery(hql);
        query.setParameter("status", status);
        query.setParameter("idUser", idUser);
        query.executeUpdate();
    }
    @Override

    public void deleteUser(int theId) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("delete from User where id = :userId");
        query.setParameter("userId", theId);
        query.executeUpdate();
    }

    @Override
    public boolean updateUser(Map<String, Object> params) {
        Session currentSession = this.sessionFactory.openSession();
        Transaction transaction = null;

        boolean var5;
        try {
            transaction = currentSession.beginTransaction();
            String hql = "UPDATE User SET full_name = :fullName, phone_number = :phoneNumber, address = :address, role_id = :idRole WHERE id = :userId";
            Query query = currentSession.createQuery(hql);
            query.setParameter("fullName", params.get("fullName"));
            query.setParameter("phoneNumber", params.get("phoneNumber"));
            query.setParameter("address", params.get("address"));
            query.setParameter("idRole", Integer.parseInt(params.get("idRole").toString()));
            query.setParameter("userId", Integer.parseInt(params.get("userId").toString()));
            int result = query.executeUpdate();
            transaction.commit();
            boolean var7 = result > 0;
            return var7;
        } catch (Exception var11) {
            if (transaction != null) {
                transaction.rollback();
            }

            var11.printStackTrace();
            var5 = false;
        } finally {
            currentSession.close();
        }

        return var5;
    }

}
