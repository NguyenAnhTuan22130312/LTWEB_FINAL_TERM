package hcmuaf.nlu.edu.vn.testproject.models;

import java.util.Date;

public class Banner {
    private int id;
    private String url;
    private Date date;

    public Banner(int id, String url, Date date) {
        this.id = id;
        this.url = url;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Banner{" +
                "id=" + id +
                ", url='" + url + '\'' +
                ", date=" + date +
                '}';
    }
}
