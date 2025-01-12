package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.daos.ContactDao;

public class ContactService {
    static ContactDao contactDao = new ContactDao();
    public boolean sendContactSV(int id, String name, String email,String title,String message){
        return contactDao.sendContact(id, name, email, title, message);
    }


}
