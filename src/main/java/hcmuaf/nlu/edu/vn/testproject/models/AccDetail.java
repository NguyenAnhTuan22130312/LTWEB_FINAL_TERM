package hcmuaf.nlu.edu.vn.testproject.models;

public class AccDetail {
    private int idAcc;
    private String fullName;
    private String phoneNumber;
    private String address;
    private int gender; // 0: nam, 1:nữ, 2:khác
    private String birthDate;
    private String email;

    public AccDetail() {
    }

    public AccDetail(int idAcc, String fullName, String phoneNumber, String address, int gender, String birthDate) {
        this.idAcc = idAcc;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.gender = gender;
        this.birthDate = birthDate;
    }

    public AccDetail(int idAcc, String fullName, String phoneNumber, String address, int gender, String birthDate, String email) {
        this.idAcc = idAcc;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.gender = gender;
        this.birthDate = birthDate;
        this.email = email;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    @Override
    public String toString() {
        return "AccDetail{" +
                "idAcc=" + idAcc +
                ", fullName='" + fullName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", gender=" + gender +
                ", birthDate='" + birthDate + '\'' +
                '}';
    }
}
