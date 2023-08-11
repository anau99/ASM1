package demoCRUD.Dao;

import demoCRUD.Entity.User;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface UserDao {
    public List<User> getUsers();

   public void saveUser(Map<String, Object> params);
   public List<User> searchUsers(String searchQuery);
   public void accessPermissions(String var1, String var2);
  public boolean userNameOrPasswordAreExisted(@RequestParam Map<String, Object> var1);
   public  void deleteUser(int var1);

   public boolean updateUser(Map<String, Object> var1);
}
