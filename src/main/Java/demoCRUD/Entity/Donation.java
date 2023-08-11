package demoCRUD.Entity;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "donation")
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "code")
    private String code;

    @Column(name = "created")
    private String created;

    @Column(name = "description")
    private String description;

    @Column(name = "end_date")
    private String endDate;


    @Column(name = "money")
    private int money;

    @Column(name = "name")
    private String name;

    @Column(name = "organization_name")
    private String organizationName;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "start_date")
    private String startDate;

    @Column(name = "status")
    private int status;

    @Column(name = "visited")
    private int visited;

    @OneToMany(mappedBy = "donation", fetch = FetchType.LAZY)
    private List<UserDonation> userDonations;

    // Constructors, getters, and setters

    // ...
    public Donation() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getVisited(){
        return this.visited;
    }
    public void setVisited(int visited){
        this.visited = visited;
    }
    public List<UserDonation> getUserDonations() {
        return userDonations;
    }

    public void setUserDonations(List<UserDonation> userDonations) {
        this.userDonations = userDonations;
    }


}
