package demoCRUD.Controller;

import demoCRUD.Dao.UserDao;
import demoCRUD.Entity.Role;
import demoCRUD.Entity.User;
import demoCRUD.Service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

//@Controller
//@RequestMapping("/Role")
public class RoleControler {
    //need to be inject Rolle Service
  //  @Autowired
    private RoleService roleService;
    //@GetMapping("/list")
    public String listRoles(Model theModel){
      //  List<Role>roles = roleService.roles();
        //theModel.addAttribute("roles",roles);
        return "account";
    }

}
