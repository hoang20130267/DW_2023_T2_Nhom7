package Bean;

import java.util.List;

public class ProvinceResult {
    private String tenTinh;
    private String loaiVe;
    private List<Prize> prizes;

    public ProvinceResult() {
    }

    public ProvinceResult(String tenTinh, String loaiVe, List<Prize> prizes) {
        this.tenTinh = tenTinh;
        this.loaiVe = loaiVe;
        this.prizes = prizes;
    }

    public String getTenTinh() {
        return tenTinh;
    }

    public void setTenTinh(String tenTinh) {
        this.tenTinh = tenTinh;
    }

    public String getLoaiVe() {
        return loaiVe;
    }

    public void setLoaiVe(String loaiVe) {
        this.loaiVe = loaiVe;
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
                ", loaiVe='" + loaiVe + '\'' +
                ", prizes=" + prizes +
                '}';
    }
}

