package hcmuaf.nlu.edu.vn.testproject.models;

public class AccDetail {
    private int idAcc;
    private String fullName;
    private String phoneNumber;
    private String email;
    private String address;
    private int gender; // 0: nam, 1:nữ, 2:khác
    private String birthDate;

    public AccDetail() {
    }

    public AccDetail(int idAcc, String fullName, String phoneNumber, String email, String address, int gender, String birthDate) {
        this.idAcc = idAcc;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.gender = gender;
        this.birthDate = birthDate;
    }

    public int getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(int idAcc) {
        this.idAcc = idAcc;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }
}
