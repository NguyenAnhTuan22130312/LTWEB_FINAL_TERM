package hcmuaf.nlu.edu.vn.testproject.models;

import java.time.LocalDateTime;

public class PasswordResetToken {
    private int id;
    private boolean isUsed;
    private String token;
    private LocalDateTime experyTime;
    private int userId;

    public PasswordResetToken() {
    }

    public PasswordResetToken(int id, boolean isUsed, String token, LocalDateTime experyTime, int userId) {
        this.id = id;
        this.isUsed = isUsed;
        this.token = token;
        this.experyTime = experyTime;
        this.userId = userId;
    }

    public PasswordResetToken(int userId, boolean isUsed, String token, LocalDateTime experyTime) {
        this.isUsed = isUsed;
        this.token = token;
        this.experyTime = experyTime;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isUsed() {
        return isUsed;
    }

    public void setUsed(boolean used) {
        isUsed = used;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public LocalDateTime getExperyTime() {
        return experyTime;
    }

    public void setExpiryTime(LocalDateTime experyTime) {
        this.experyTime = experyTime;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "PasswordResetToken{" +
                "id=" + id +
                ", isUsed=" + isUsed +
                ", token='" + token + '\'' +
                ", expiryTime=" + experyTime +
                ", userId=" + userId +
                '}';
    }
}
