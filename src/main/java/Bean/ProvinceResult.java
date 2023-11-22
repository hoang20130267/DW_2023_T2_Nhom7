package Bean;

import java.util.List;

public class ProvinceResult {
    private String tenTinh;
    private List<Prize> prizes;

    public ProvinceResult() {
    }

    public ProvinceResult(String tenTinh, List<Prize> prizes) {
        this.tenTinh = tenTinh;
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

    @Override
    public String toString() {
        return "ProvinceResult{" +
                "tenTinh='" + tenTinh + '\'' +
                ", prizes=" + prizes +
                '}';
    }
}

