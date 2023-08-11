package demoCRUD.Service;
import demoCRUD.Dao.UserDao;
import demoCRUD.Entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    @Transactional
    public List<User> getUsers(){

        return userDao.getUsers();
    }

    @Override
    @Transactional
    public void saveUser(@RequestParam Map<String, Object> params, HttpSession session){

        if(!userNameOrPasswordAreExisted(params)){
            userDao.saveUser(params);
            session.setAttribute("message","Thêm User thành công");
        }
        else
            session.setAttribute("message","username hoặc password đã tồn tại");

    }
    @Override
    @Transactional
    public boolean userNameOrPasswordAreExisted(@RequestParam Map<String, Object> params){
        return userDao.userNameOrPasswordAreExisted(params);
    }

    @Override
    @Transactional
    public List<User> searchUsers(String searchQuery){

        return userDao.searchUsers(searchQuery);
    }
    @Override
    @Transactional
    public void accessPermissions(String actionQuery,String idUserQuery){
        userDao.accessPermissions(actionQuery, idUserQuery);
    }

    @Override
    @Transactional
    public void deleteUser(int theId){
        userDao.deleteUser(theId);
    }

    @Override
    @Transactional
    public boolean updateUser(Map<String,Object> params){

       return userDao.updateUser(params);
    }
}
