package Bean;

import java.util.List;

public class LotteryResult {
    private String title;
    private String ngayThang;
    private List<ProvinceResult> provinceResults;

    public LotteryResult() {
    }

    public LotteryResult(String title, String ngayThang, List<ProvinceResult> provinceResults) {
        this.title = title;
        this.ngayThang = ngayThang;
        this.provinceResults = provinceResults;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNgayThang() {
        return ngayThang;
    }

    public void setNgayThang(String ngayThang) {
        this.ngayThang = ngayThang;
    }

    public List<ProvinceResult> getProvinceResults() {
        return provinceResults;
    }

    public void setProvinceResults(List<ProvinceResult> provinceResults) {
        this.provinceResults = provinceResults;
    }

    @Override
    public String toString() {
        return "LotteryResult{" +
                "title='" + title + '\'' +
                ", ngayThang='" + ngayThang + '\'' +
                ", provinceResults=" + provinceResults +
                '}';
    }
}

