package Bean;

public class Configuration {
    private int id;
    private String file_name;
    private String path;
    private String url;
    private String user_database;
    private String password_database;
    private int flag;
    private String status;


    public Configuration(int id, String file_name, String path, String url, String user_database, String password_database, int flag, String status) {
        this.id = id;
        this.file_name = file_name;
        this.path = path;
        this.url = url;
        this.user_database = user_database;
        this.password_database = password_database;
        this.flag = flag;
        this.status = status;
    }

    public Configuration() {
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getUser_database() {
        return user_database;
    }

    public void setUser_database(String user_database) {
        this.user_database = user_database;
    }

    public String getPassword_database() {
        return password_database;
    }

    public void setPassword_database(String password_database) {
        this.password_database = password_database;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Configuration{" +
                "id=" + id +
                ", file_name='" + file_name + '\'' +
                ", path='" + path + '\'' +
                ", url='" + url + '\'' +
                ", user_database='" + user_database + '\'' +
                ", password_database='" + password_database + '\'' +
                ", flag=" + flag +
                ", status='" + status + '\'' +
                '}';
    }
}
