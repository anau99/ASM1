package demoCRUD.Controller;
import demoCRUD.Entity.Donation;
import demoCRUD.Entity.UserDonation;
import demoCRUD.Service.DonationService;
import demoCRUD.Service.UserDonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/UserDonation")
public class UserDonationController {
    //need to inject UserDoantion Service
      @Autowired
      private UserDonationService userDonationService;
      @Autowired
      private DonationService donationService;

    @GetMapping("/donationList")
    public String listDonation(Model theModel){
        //get users and all roles
        List<Donation>donations = userDonationService.getDonationsLimitFive();
        theModel.addAttribute("donations",donations);
        return "home";
    }

    @GetMapping("/detailDonation")
    public String detailDonation(@RequestParam("donationId") int donationId,Model theModel){
       Donation donation =  donationService.getDonationById(donationId);
        theModel.addAttribute("donation", donation);
        return "detaildonation";
    }

    @PostMapping("/saveUserDonation")
    public String saveUserDonation(@ModelAttribute("userdonation")UserDonation userDonation,
                                   @RequestParam("donationID") int donationId){
       boolean isOK = userDonationService.saveUserDonation(userDonation,donationId);
        return "redirect:/UserDonation/detailDonation?donationId="+donationId;
    }
    //6.2.Thực hiện quyên góp khi xem thông chi tiết của một đợt quyên góp (dành cho người dùng hệ thống)
    //do không yêu cầu chức năng login, nên bỏ qua bước kiểm tra vai trò của user đang ở trong httpsession có phai
    //là admin hay không
    @PostMapping("/addUserDonationByAdmin")
    public String addUserDonationByAdmin(@ModelAttribute("userdonation")UserDonation userDonation,
                                         @RequestParam("donationId") int donationId){
        userDonationService.saveUserDonation(userDonation,donationId);
        return "redirect:/UserDonation/detailDonation?donationId="+donationId;
    }



}
