package Bean;

import java.util.ArrayList;
import java.util.List;

public class Dmart {
    int id;
    String date;
    String domain;
    String provice;
    String prize;
    String number_winning;

    private List<Dmart> dmartList;

    public Dmart() {
    }

    public Dmart(List<Dmart> dmartList) {
        this.dmartList = dmartList;
    }

    public Dmart(int id, String date, String domain, String provice, String prize, String number_winning) {
        this.id = id;
        this.date = date;
        this.domain = domain;
        this.provice = provice;
        this.prize = prize;
        this.number_winning = number_winning;
    }

    public List<String> getNumberWinningByPrize(String prize) {
        List<String> results = new ArrayList<>();

        for (Dmart dmart : dmartList) {
            if (dmart.getPrize().equalsIgnoreCase(prize)) {
                results.add(dmart.getNumber_winning());
            }
        }
        return results.isEmpty() ? null : results;
    }
    public List<String> getListProvince() {
        List<String> results = new ArrayList<>();
        for (Dmart dmart : dmartList) {
            results.add(dmart.getProvice());
        }
        return results.isEmpty() ? null : results;
    }
    public String getCurrentDate(){
        String result = "";
        result = dmartList.get(0).getDate();
        return result.isEmpty() ? null : result;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getProvice() {
        return provice;
    }

    public void setProvice(String provice) {
        this.provice = provice;
    }

    public String getPrize() {
        return prize;
    }

    public void setPrize(String prize) {
        this.prize = prize;
    }

    public String getNumber_winning() {
        return number_winning;
    }

    public void setNumber_winning(String number_winning) {
        this.number_winning = number_winning;
    }

    @Override
    public String toString() {
        return "Dmart{" +
                "id=" + id +
                ", date='" + date + '\'' +
                ", domain='" + domain + '\'' +
                ", provice='" + provice + '\'' +
                ", prize='" + prize + '\'' +
                ", number_winning='" + number_winning + '\'' +
                '}';
    }
}
