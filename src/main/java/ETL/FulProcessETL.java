package ETL;

import java.text.ParseException;

public class FulProcessETL {
    public static void main(String[] args) {
        try {
            Extracting.Crawling();
            Transform.updateConfiguration();
           Load.loadingAndUpdateConfig();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
