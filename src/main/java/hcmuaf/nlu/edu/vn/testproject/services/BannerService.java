package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.daos.BannerDao;
import hcmuaf.nlu.edu.vn.testproject.models.Banner;

import java.util.ArrayList;
import java.util.List;

public class BannerService {
    static BannerDao instance = new BannerDao();
    public List<Banner> getBanners() {
        return  instance.getBanners();
    }
}
