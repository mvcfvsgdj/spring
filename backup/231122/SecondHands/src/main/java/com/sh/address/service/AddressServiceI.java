package com.sh.address.service;

import org.springframework.stereotype.Service;

import com.sh.address.domain.AddressDTO;

public interface AddressServiceI {

	public int registerMember(AddressDTO addressDTO);

}
