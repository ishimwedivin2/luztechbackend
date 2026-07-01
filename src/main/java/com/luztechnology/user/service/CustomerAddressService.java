package com.luztechnology.user.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.user.dto.CustomerAddressRequest;
import com.luztechnology.user.dto.CustomerAddressResponse;
import com.luztechnology.user.entity.CustomerAddress;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.CustomerAddressRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CustomerAddressService {

    private final CustomerAddressRepository addressRepository;

    @Transactional(readOnly = true)
    public List<CustomerAddressResponse> getAddresses(User customer) {
        return addressRepository.findByCustomerOrderByDefaultAddressDescCreatedAtDesc(customer).stream()
                .map(this::toResponse)
                .toList();
    }

    @Transactional
    public CustomerAddress createAddress(User customer, CustomerAddressRequest request) {
        boolean makeDefault = request.isDefaultAddress() || addressRepository.countByCustomer(customer) == 0;
        if (makeDefault) clearDefault(customer);

        CustomerAddress address = CustomerAddress.builder()
                .customer(customer)
                .label(clean(request.getLabel()))
                .province(clean(request.getProvince()))
                .district(clean(request.getDistrict()))
                .sector(clean(request.getSector()))
                .cell(clean(request.getCell()))
                .village(clean(request.getVillage()))
                .deliveryInstructions(clean(request.getDeliveryInstructions()))
                .deliveryPhoneNumber(clean(request.getDeliveryPhoneNumber()))
                .defaultAddress(makeDefault)
                .build();
        return addressRepository.save(address);
    }

    @Transactional
    public CustomerAddressResponse updateAddress(User customer, UUID id, CustomerAddressRequest request) {
        CustomerAddress address = getAddressEntity(customer, id);
        if (request.isDefaultAddress()) clearDefault(customer);

        address.setLabel(clean(request.getLabel()));
        address.setProvince(clean(request.getProvince()));
        address.setDistrict(clean(request.getDistrict()));
        address.setSector(clean(request.getSector()));
        address.setCell(clean(request.getCell()));
        address.setVillage(clean(request.getVillage()));
        address.setDeliveryInstructions(clean(request.getDeliveryInstructions()));
        address.setDeliveryPhoneNumber(clean(request.getDeliveryPhoneNumber()));
        address.setDefaultAddress(request.isDefaultAddress());
        return toResponse(addressRepository.save(address));
    }

    @Transactional
    public CustomerAddressResponse setDefault(User customer, UUID id) {
        CustomerAddress address = getAddressEntity(customer, id);
        clearDefault(customer);
        address.setDefaultAddress(true);
        return toResponse(addressRepository.save(address));
    }

    @Transactional
    public void deleteAddress(User customer, UUID id) {
        CustomerAddress address = getAddressEntity(customer, id);
        boolean wasDefault = address.isDefaultAddress();
        addressRepository.delete(address);
        if (wasDefault) {
            addressRepository.findByCustomerOrderByDefaultAddressDescCreatedAtDesc(customer).stream()
                    .findFirst()
                    .ifPresent(next -> {
                        next.setDefaultAddress(true);
                        addressRepository.save(next);
                    });
        }
    }

    @Transactional(readOnly = true)
    public CustomerAddress getAddressEntity(User customer, UUID id) {
        return addressRepository.findByIdAndCustomer(id, customer)
                .orElseThrow(() -> new ResourceNotFoundException("Saved address not found"));
    }

    public CustomerAddressResponse toResponse(CustomerAddress address) {
        return CustomerAddressResponse.builder()
                .id(address.getId())
                .label(address.getLabel())
                .province(address.getProvince())
                .district(address.getDistrict())
                .sector(address.getSector())
                .cell(address.getCell())
                .village(address.getVillage())
                .deliveryInstructions(address.getDeliveryInstructions())
                .deliveryPhoneNumber(address.getDeliveryPhoneNumber())
                .defaultAddress(address.isDefaultAddress())
                .formattedAddress(formatAddress(address))
                .createdAt(address.getCreatedAt())
                .build();
    }

    public String formatAddress(CustomerAddress address) {
        return formatAddress(
                address.getProvince(),
                address.getDistrict(),
                address.getSector(),
                address.getCell(),
                address.getVillage(),
                address.getDeliveryInstructions());
    }

    public String formatAddress(String province, String district, String sector, String cell, String village, String instructions) {
        String base = java.util.stream.Stream.of(village, cell, sector, district, province)
                .map(this::clean)
                .filter(part -> part != null && !part.isBlank())
                .collect(java.util.stream.Collectors.joining(", "));
        String note = clean(instructions);
        return note == null || note.isBlank() ? base : base + " - " + note;
    }

    private void clearDefault(User customer) {
        addressRepository.findByCustomerOrderByDefaultAddressDescCreatedAtDesc(customer).forEach(address -> {
            if (address.isDefaultAddress()) {
                address.setDefaultAddress(false);
                addressRepository.save(address);
            }
        });
    }

    private String clean(String value) {
        if (value == null) return null;
        String trimmed = value.trim();
        return trimmed.isEmpty() ? null : trimmed;
    }
}
