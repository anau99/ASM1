package demoCRUD.Validator;

import demoCRUD.Entity.Donation;

import java.util.Arrays;

public class ValidatorDonation {

    public int searchTypeDonation(String seachQuery){
        //Initial a string Array
        int ans = -1;
        String[]mapStatus = new String[]{"mới tạo", "đang quyên góp", "kết thúc quyên góp","đóng quyên góp"};
        for (int i = 0; i < mapStatus.length;i++){
            if(mapStatus[i].startsWith(seachQuery))
                return i;
        }
        return ans;

    }

}
