package Bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Staging {
    private String prize;
    private String province;
    private String domain;
    private String number_winning;
    private String date;
    private String date_updated;
    private String date_expired;

    public Staging() {
    }

    public Staging(String prize, String province, String domain, String number_winning, String date, String date_updated, String date_expired) {
        this.prize = prize;
        this.province = province;
        this.domain = domain;
        this.number_winning = number_winning;
        this.date = date;
        this.date_updated = date_updated;
        this.date_expired = date_expired;
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

    public String getDate_updated() {
        return date_updated;
    }

    public void setDate_updated(String date_updated) {
        this.date_updated = date_updated;
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
                "prize='" + prize + '\'' +
                ", province='" + province + '\'' +
                ", domain='" + domain + '\'' +
                ", number_winning='" + number_winning + '\'' +
                ", date='" + date + '\'' +
                ", date_updated='" + date_updated + '\'' +
                ", date_expired='" + date_expired + '\'' +
                '}';
    }

    public void calculateDates() {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        try {
            Date parsedDate = sdf.parse(this.date);
            // Set date_updated
            this.date_updated = sdf.format(parsedDate);
            // Set date_expired
            long millis = parsedDate.getTime() + (30 * 24 * 60 * 60 * 1000L);
            this.date_expired = sdf.format(new Date(millis));
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
