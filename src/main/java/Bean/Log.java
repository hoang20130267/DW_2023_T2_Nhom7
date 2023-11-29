package Bean;

public class Log {
    private int id;
    private int configuration_id;
    private String name;
    private String description;
    private String status;
    private String date_created;
    private String date_updated;

    public Log() {
    }

    public Log(int id, int configuration_id, String name, String description, String status, String date_created, String date_updated) {
        this.id = id;
        this.configuration_id = configuration_id;
        this.name = name;
        this.description = description;
        this.status = status;
        this.date_created = date_created;
        this.date_updated = date_updated;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getConfiguration_id() {
        return configuration_id;
    }

    public void setConfiguration_id(int configuration_id) {
        this.configuration_id = configuration_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }

    public String getDate_updated() {
        return date_updated;
    }

    public void setDate_updated(String date_updated) {
        this.date_updated = date_updated;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", configuration_id=" + configuration_id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                ", date_created='" + date_created + '\'' +
                ", date_updated='" + date_updated + '\'' +
                '}';
    }
}
