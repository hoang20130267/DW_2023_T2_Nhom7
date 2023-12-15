package Bean;

import java.util.List;

public class ProvinceResult {
    private String tenTinh;
    private String domain;
    private String date;
    private List<Prize> prizes;

    public ProvinceResult() {
    }

    public ProvinceResult(String tenTinh,  String domain, List<Prize> prizes) {
        this.tenTinh = tenTinh;
        this.domain = domain;
        this.prizes = prizes;
    }

    public ProvinceResult(String tenTinh, String domain, String date, List<Prize> prizes) {
        this.tenTinh = tenTinh;
        this.domain = domain;
        this.date = date;
        this.prizes = prizes;
    }

    public String getTenTinh() {
        return tenTinh;
    }

    public void setTenTinh(String tenTinh) {
        this.tenTinh = tenTinh;
    }


    public List<Prize> getPrizes() {
        return prizes;
    }

    public void setPrizes(List<Prize> prizes) {
        this.prizes = prizes;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "ProvinceResult{" +
                "tenTinh='" + tenTinh + '\'' +
                ", prizes=" + prizes +
                '}';
    }
}

