package Bean;

import java.util.List;

public class Prize {
    private String tenGiai;
    private List<String> soTrungThuong;

    public Prize() {
    }

    public Prize(String tenGiai, List<String> soTrungThuong) {
        this.tenGiai = tenGiai;
        this.soTrungThuong = soTrungThuong;
    }

    public String getTenGiai() {
        return tenGiai;
    }

    public void setTenGiai(String tenGiai) {
        this.tenGiai = tenGiai;
    }

    public List<String> getSoTrungThuong() {
        return soTrungThuong;
    }

    public void setSoTrungThuong(List<String> soTrungThuong) {
        this.soTrungThuong = soTrungThuong;
    }

    @Override
    public String toString() {
        return "Prize{" +
                "tenGiai='" + tenGiai + '\'' +
                ", soTrungThuong=" + soTrungThuong +
                '}';
    }
}

