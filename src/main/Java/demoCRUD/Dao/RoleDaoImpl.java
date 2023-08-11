package demoCRUD.Dao;

import demoCRUD.Entity.Role;
import demoCRUD.Entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RoleDaoImpl implements RoleDao{
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Role> roles(){
        //get the current session
        Session currentSession =sessionFactory.getCurrentSession();
        Query<Role> theQuery =currentSession.createQuery("from Role",Role.class);
        List<Role>roles = theQuery.getResultList();
        return roles;
    }
}
