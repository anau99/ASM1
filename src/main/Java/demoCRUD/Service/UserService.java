package demoCRUD.Service;
import demoCRUD.Entity.Donation;
import demoCRUD.Entity.User;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public interface UserService {
    public List<User> getUsers();
    public void saveUser(@RequestParam Map<String, Object> params, HttpSession session);
    public boolean userNameOrPasswordAreExisted(@RequestParam Map<String, Object> params);
    public List<User> searchUsers(String searchQuery);
    public void accessPermissions(String actionQuery,String idUserQuery);
    public void deleteUser(int theId);
    public boolean updateUser(Map<String,Object> params);


}
