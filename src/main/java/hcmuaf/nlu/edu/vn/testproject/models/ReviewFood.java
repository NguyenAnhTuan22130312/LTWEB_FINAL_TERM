package hcmuaf.nlu.edu.vn.testproject.models;

import java.util.Date;

public class ReviewFood {
    private  String userName;
    private int idReview;
    private int idFood;
    private int rating;
    private int idAcc;
    private Date date;

    public ReviewFood(String userName, int idReview, int idFood, int rating, int idAcc, Date date) {
        this.userName = userName;
        this.idReview = idReview;
        this.idFood = idFood;
        this.rating = rating;
        this.idAcc = idAcc;
        this.date = date;
    }

    @Override
    public String toString() {
        return "ReviewFood{" +
                "userName='" + userName + '\'' +
                ", idReview=" + idReview +
                ", idFood=" + idFood +
                ", rating=" + rating +
                ", idAcc=" + idAcc +
                ", date=" + date +
                '}';
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getIdReview() {
        return idReview;
    }

    public void setIdReview(int idReview) {
        this.idReview = idReview;
    }

    public int getIdFood() {
        return idFood;
    }

    public void setIdFood(int idFood) {
        this.idFood = idFood;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(int idAcc) {
        this.idAcc = idAcc;
    }


    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
