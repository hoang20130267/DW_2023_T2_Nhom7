package Bean;

public class Staging {
    private int id;
    private String prize;
    private String province;
    private String domain;
    private String number_winning;
    private String date;
    private String date_update;
    private String date_expired;

    public Staging(int id, String prize, String province, String domain, String number_winning, String date, String date_update, String date_expired) {
        this.id = id;
        this.prize = prize;
        this.province = province;
        this.domain = domain;
        this.number_winning = number_winning;
        this.date = date;
        this.date_update = date_update;
        this.date_expired = date_expired;
    }

    public Staging() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPrize() {
        return prize;
    }

    public void setPrize(String prize) {
        this.prize = prize;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getNumber_winning() {
        return number_winning;
    }

    public void setNumber_winning(String number_winning) {
        this.number_winning = number_winning;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDate_update() {
        return date_update;
    }

    public void setDate_update(String date_update) {
        this.date_update = date_update;
    }

    public String getDate_expired() {
        return date_expired;
    }

    public void setDate_expired(String date_expired) {
        this.date_expired = date_expired;
    }

    @Override
    public String toString() {
        return "Staging{" +
                "id=" + id +
                ", prize='" + prize + '\'' +
                ", province='" + province + '\'' +
                ", domain='" + domain + '\'' +
                ", number_winning='" + number_winning + '\'' +
                ", date='" + date + '\'' +
                ", date_update='" + date_update + '\'' +
                ", date_expired='" + date_expired + '\'' +
                '}';
    }
}
