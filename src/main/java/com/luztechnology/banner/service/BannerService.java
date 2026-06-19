package com.luztechnology.banner.service;

import com.luztechnology.banner.dto.BannerRequest;
import com.luztechnology.banner.entity.Banner;
import com.luztechnology.banner.repository.BannerRepository;
import com.luztechnology.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class BannerService {

    private final BannerRepository bannerRepository;

    @Transactional(readOnly = true)
    public List<Banner> getActiveBanners() {
        return bannerRepository.findByActiveTrueOrderByDisplayOrderAsc();
    }

    @Transactional(readOnly = true)
    public List<Banner> getAllBanners() {
        return bannerRepository.findAll();
    }

    @Transactional
    public Banner createBanner(BannerRequest request) {
        Banner banner = Banner.builder()
                .title(request.getTitle())
                .subtitle(request.getSubtitle())
                .imageUrl(request.getImageUrl())
                .linkUrl(request.getLinkUrl())
                .buttonText(request.getButtonText())
                .tagLabel(request.getTagLabel())
                .active(request.isActive())
                .displayOrder(request.getDisplayOrder())
                .productId(request.getProductId())
                .build();
        return bannerRepository.save(banner);
    }

    @Transactional
    public Banner updateBanner(UUID id, BannerRequest request) {
        Banner banner = bannerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Banner not found: " + id));
        banner.setTitle(request.getTitle());
        banner.setSubtitle(request.getSubtitle());
        banner.setImageUrl(request.getImageUrl());
        banner.setLinkUrl(request.getLinkUrl());
        banner.setButtonText(request.getButtonText());
        banner.setTagLabel(request.getTagLabel());
        banner.setActive(request.isActive());
        banner.setDisplayOrder(request.getDisplayOrder());
        banner.setProductId(request.getProductId());
        return bannerRepository.save(banner);
    }

    @Transactional
    public Banner toggleActive(UUID id) {
        Banner banner = bannerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Banner not found: " + id));
        banner.setActive(!banner.isActive());
        return bannerRepository.save(banner);
    }

    @Transactional
    public void deleteBanner(UUID id) {
        bannerRepository.deleteById(id);
    }
}
