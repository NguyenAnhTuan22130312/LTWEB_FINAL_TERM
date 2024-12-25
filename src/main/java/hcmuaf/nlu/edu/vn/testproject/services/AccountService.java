package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.daos.AccountDAO;
import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;

public class AccountService {
    private final AccountDAO accountDAO  = new AccountDAO();

    public AccDetail getUserById(int id) {
        return accountDAO.getUserById(id);
    }

    public boolean updateUser (AccDetail user) {
        return accountDAO.updateUser(user);
    }
}
