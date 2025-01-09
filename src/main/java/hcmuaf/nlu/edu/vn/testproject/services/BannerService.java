package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.daos.BannerDao;
import hcmuaf.nlu.edu.vn.testproject.models.Banner;
import jakarta.servlet.annotation.MultipartConfig;

import java.util.ArrayList;
import java.util.List;

public class BannerService {
    BannerDao dao = new BannerDao();

    public List<Banner> getBanners() {
        List<Banner> banners = dao.getBanners();
        return banners;
    }

    public void addBanner(Banner banner) {
        dao.addBanner(banner);
    }

    public void deleteBanner(int id) {
        dao.deleteBaner(id);
    }

    public static void main(String[] args) {
        BannerService bannerService = new BannerService();
        List<Banner> banners = bannerService.getBanners();
        for (Banner banner : banners) {
            System.out.println(banner);
        }
    }
}
