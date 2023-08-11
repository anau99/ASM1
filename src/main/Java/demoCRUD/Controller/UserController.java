package demoCRUD.Controller;
import demoCRUD.Entity.Role;
import demoCRUD.Entity.User;
import demoCRUD.Service.RoleService;
import demoCRUD.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/User")
public class UserController {
    //need to inject User Service
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @GetMapping("/list")
    public String listUsers(Model theModel){
        //get users and all roles
        List<User> users = userService.getUsers();
        List<Role>roles = roleService.roles();
        theModel.addAttribute("users",users);
        theModel.addAttribute("roles",roles);
        return "account";
    }
    @GetMapping("/saveUser")
    public String saveUser(@RequestParam Map<String, Object> params, HttpSession session){
        userService.saveUser(params,session);
        //Set timeLimit of this session is 2 seconds
        session.setMaxInactiveInterval(2);
        return "redirect:/User/list";

    }
    @GetMapping("/searchUser")
    public String searchUsers(@RequestParam("searchQuery") String searchQuery,Model theModel) {
        List<User> users =   userService.searchUsers(searchQuery.toString().trim());
        List<Role>roles = roleService.roles();
        theModel.addAttribute("users",users);
        theModel.addAttribute("roles",roles);
        return "account";

    }

    @GetMapping("/accessPermissions")
    public String accessPermissions(@RequestParam("action") String actionQuery, @RequestParam("idUser") String idUserQuery){
        userService.accessPermissions(actionQuery,idUserQuery);
        return "redirect:/User/list";
    }

    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("userId") String userId) {
        userService.deleteUser(Integer.parseInt(userId));

        return "redirect:/User/list";
    }

    @PostMapping("/updateUser")
    public String updateUser(@RequestParam Map<String, Object> params, HttpSession sessionUpdate) {
      if(userService.updateUser(params))
          sessionUpdate.setAttribute("message","Update User thành công");
      else
          sessionUpdate.setAttribute("message","Updae User không thành công");
      sessionUpdate.setMaxInactiveInterval(1);
      return "redirect:/User/list";
    }









}
