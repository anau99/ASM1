package demoCRUD;

import javax.jws.WebService;
import java.sql.Connection;
import java.sql.DriverManager;

public class testDB {
    public  static void main(String[] args){
        String user = "root";
        String password = "123456";
        //  String jdbcUrl = "jdbc:mysql://localhost:3306/ASM1?useSSL=false&serverTimezone=PST";
        String jdbcUrl = "jdbc:mysql://localhost:3306/web_customer_tracker?useSSL=false&serverTimezone=PST";
        try {
            System.out.println("Connecting to database: " + jdbcUrl);
            Connection conn = DriverManager.getConnection(jdbcUrl, user, password);
            System.out.println("Connection successful!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        String x = "hello";
    }
}
