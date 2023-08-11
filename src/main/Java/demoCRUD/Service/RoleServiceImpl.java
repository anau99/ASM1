package demoCRUD.Service;
import demoCRUD.Dao.RoleDao;
import demoCRUD.Entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService{
    @Autowired
    private RoleDao roleDao;
    @Override
    @Transactional
    public List<Role>roles(){
        return roleDao.roles();
    }


}
