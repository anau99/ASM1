package demoCRUD.Controller;
import demoCRUD.Entity.Donation;
import demoCRUD.Service.DonationService;
import demoCRUD.Service.UserDonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
@Controller
@RequestMapping("/Donation")
public class DonationController {
    //nạp donationService 1 cách tự động trong bean
    @Autowired
    private DonationService donationService;
    //nạp userDonationService 1 cách tự động
    @Autowired
    private UserDonationService userDonationService;

    /*
    * Hàm này để lấy tất cả các donation ra màn hình
    * @param Model themodel để lưu trữ các donations từ service và render cho người dùng
    * */
    @GetMapping("/list")
    public String getDonations(Model theModel){
        //Thực hiện lấy các donation
        List<Donation> donations = donationService.getDonations();
        theModel.addAttribute("donations",donations);
        return "donation";
    }
    /*
    *Thêm  1 doantion mới
    * @Map<String, Object> params : dữ liệu lấy từ request của người dùng được lưu và Hashtable
    * @param HttpSession httpSession để thông báo là là đã tạo mới thành công hay không?
     */
    @PostMapping("/saveDonation")
    public String saveDonation(@RequestParam Map<String, Object> params, HttpSession httpSession) throws ParseException {
        String startDateStr = (String) params.get("startDate");
        String endDateStr = (String) params.get("endDate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = dateFormat.parse(startDateStr);
        Date endDate = dateFormat.parse(endDateStr);
        if(startDate.after(endDate))
            httpSession.setAttribute("message","Ngày bắt đầu không được sau ngày kết thúc");
        else {

            donationService.saveDonation(params);
            httpSession.setAttribute("message","Đã thêm donation thành công");
        }
        httpSession.setMaxInactiveInterval(1);

        return "redirect:/Donation/list";

    }
    /* Tìm kiếm 1 donation từ người dùng
    *@param String searchQuery : Chuỗi tìm kiếm từ người dùng
    * @param Model themodel : Lưu trữ vào model để hiển thị cho người dùng
     */
    @GetMapping("/searchDonation")
    public String searchDonation(@RequestParam("searchQuery") String searchQuery,Model theModel){
        List<Donation>donations = donationService.searchDonation(searchQuery.toString().trim().toLowerCase());
        if(donations.isEmpty() || donations.size()==0)
            return "redirect:/Donation/list";
        theModel.addAttribute("donations",donations);
        return "donation";
    }
    /* xóa 1 donation
    * @String donationId : 1 chuỗi được lấy từ request của người dùng là id của Donation
    *@param HttpSession httpSession để thông báo là là đã xóa thành công hay không?
     */
    @PostMapping("/deleteDonation")
    public String deleteDonation(@RequestParam("donationId") String donationId, HttpSession httpSession){
       int rowAffected =  donationService.deleteDonation(Integer.parseInt(donationId));
       if(rowAffected==1)
           httpSession.setAttribute("message","Đã xóa thành công");
       else
           httpSession.setAttribute("message","Xóa không thành công");
        httpSession.setMaxInactiveInterval(1);

        return "redirect:/Donation/list";
    }

    /*Update 1 donation
     *@Map<String, Object> params la 1 hashtable được lấy từ người dùng khi request
    *@param HttpSession httpSession để thông báo là là đã update thành công hay không?
     */
    @PostMapping("/updateDonation")
    public String updateDonation(@RequestParam Map<String, Object> params, HttpSession sessionUpdate) throws ParseException {
        String startDateStr = (String) params.get("startDate");
        String endDateStr = (String) params.get("endDate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = dateFormat.parse(startDateStr);
        Date endDate = dateFormat.parse(endDateStr);
        if(startDate.after(endDate))
            sessionUpdate.setAttribute("message","Ngày bắt đầu không được sau ngày kết thúc");
        else {
            if(donationService.updateDonation(params))
                sessionUpdate.setAttribute("message","Đã update donation thành công");
           else
                sessionUpdate.setAttribute("message","Đã update donation khong thành công");
        }
        sessionUpdate.setMaxInactiveInterval(1);

        return "redirect:/Donation/list";
    }

    /*Xem chi tiết 1 donation
    *@param donationId là id của donation
    * @param model lưu trữ thông tin 1 doantion cho người dùng view
     */
    @GetMapping("/detailDonation")
    public String detailDonation(@RequestParam("donationId") int donationId, Model theModel){
        Donation donation = donationService.getDonationById(donationId);
        theModel.addAttribute("donation", donation);
        return "detail";
    }


    @PostMapping("/statusUpdateDonation")
    public String statusUpdateDonation(@RequestParam("donationId_status") String donationId_status,HttpSession sessionUpdate){
        String[]temp = donationId_status.split("-");
        Donation theDonation = new Donation();
        if(temp.length==2){
            theDonation.setStatus(Integer.parseInt(temp[1].toString()));
            theDonation.setId(Integer.parseInt(temp[0].toString()));
        }
        if(donationService.statusUpdateDonation(theDonation))
            sessionUpdate.setAttribute("message","Đã update status thành công");
        else
            sessionUpdate.setAttribute("message","Đã update status không thànhh công");
        //Set thời gian tối đa để session lưu trữ
        sessionUpdate.setMaxInactiveInterval(1);
        return "redirect:/Donation/list";
    }


    @PostMapping("acceptedADonation")
    public String acceptedADonation(@RequestParam("inputString")String dataString){
        //value="${donation.id}-${userDonation.status}-${userDonation.id}-${userDonation.money}">
        String[]temp = dataString.split("-");
        String donationId="";
        if(temp.length==4){
            donationId = temp[0];
            donationService.acceptedADonation(temp);
        }
        return  "redirect:/Donation/detailDonation?donationId="+donationId;
    }

    @PostMapping("canceledADonation")
    public String canceledADonation(@RequestParam("inputStringCanceled")String dataString){
        //value="${donation.id}-${userDonation.status}-${userDonation.id}-${userDonation.money}">
        String[]temp = dataString.split("-");
        String donationId="";
        if(temp.length==4){
            int idUserDonation = Integer.parseInt(temp[2]);
          //  int userDonationStatus = Integer.parseInt(temp[1]);
            donationId = temp[0];
            userDonationService.canceledADonation(idUserDonation);
        }
        return "redirect:/Donation/detailDonation?donationId="+donationId;
    }

}
