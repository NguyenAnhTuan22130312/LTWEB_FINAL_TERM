package hcmuaf.nlu.edu.vn.testproject.models;

import java.util.Date;

public class ReviewFood {
    private int idReview;
    private int idFood;
    private int rating;
    private String commentu;
    private Date date;
    public ReviewFood(int idReview, int idFood, int rating, String commentu, Date date) {
        this.idReview = idReview;
        this.idFood = idFood;
        this.rating = rating;
        this.commentu = commentu;
        this.date = date;

    }

    public int getIdReview() {
        return idReview;
    }

    public int getIdFood() {
        return idFood;
    }

    public int getRating() {
        return rating;
    }

    public String getCommentu() {
        return commentu;
    }

    public Date getDate() {
        return date;
    }

    public void setIdReview(int idReview) {
        this.idReview = idReview;
    }

    public void setIdFood(int idFood) {
        this.idFood = idFood;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setCommentu(String commentu) {
        this.commentu = commentu;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "ReviewFood{" +
                "idReview=" + idReview +
                ", idFood=" + idFood +
                ", rating=" + rating +
                ", commentu='" + commentu + '\'' +
                ", date=" + date +
                '}';
    }
}
