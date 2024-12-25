package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.daos.BannerDao;
import hcmuaf.nlu.edu.vn.testproject.models.Banner;

import java.util.ArrayList;
import java.util.List;

public class BannerService {
    public List<Banner> getBanners() {
        BannerDao dao = new BannerDao();
        List<Banner> banners = dao.getBanners();
        return banners;
    }

    public static void main(String[] args) {
        BannerService bannerService = new BannerService();
        List<Banner> banners = bannerService.getBanners();
        for (Banner banner : banners) {
            System.out.println(banner);
        }
    }
}
