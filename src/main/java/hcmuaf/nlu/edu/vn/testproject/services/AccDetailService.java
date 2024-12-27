package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;

public interface AccDetailService {
    public void save(AccDetail accDetail);
    public AccDetail getAccountById(int idAcc);
}
