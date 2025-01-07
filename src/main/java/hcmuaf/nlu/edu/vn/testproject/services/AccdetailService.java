package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.daos.AccdetailDAO;
import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;

import java.util.ArrayList;
import java.util.List;

public class AccdetailService {
    public List<AccDetail> getAccDetails() {
        AccdetailDAO accDetailDAO = new AccdetailDAO();
        List<AccDetail> listAcc = accDetailDAO.getAllAccDetail();
        return listAcc;
    }
}
