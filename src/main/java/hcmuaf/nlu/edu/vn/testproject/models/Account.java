package hcmuaf.nlu.edu.vn.testproject.models;

public class Account {
    private int idAcc;
    private int idRole;
    private String pass;
    private String userName;
    private String email;

    public Account(int idAcc, int idRole, String pass, String userName, String email) {
        this.idAcc = idAcc;
        this.idRole = idRole;
        this.pass = pass;
        this.userName = userName;
        this.email = email;
    }



    public Account(int idAcc, int idRole, String pass, String userName, Object o, String email) {
    }

    public int getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(int idAcc) {
        this.idAcc = idAcc;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Account{" +
                "idAcc=" + idAcc +
                ", idRole=" + idRole +
                ", pass='" + pass + '\'' +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
