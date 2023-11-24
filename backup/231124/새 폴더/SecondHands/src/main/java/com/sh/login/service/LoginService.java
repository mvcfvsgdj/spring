package com.sh.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.login.domain.LoginDTO;
import com.sh.login.repository.LoginRepositoryI;

@Service
public class LoginService implements LoginServiceI {

	
	
   @Autowired
   private LoginRepositoryI userRepository;

   @Override
   public boolean checkLogin(LoginDTO loginDTO) {
      // TODO Auto-generated method stub
      return userRepository.checklogin(loginDTO);
   }

   @Override
   public LoginDTO getUserById(String userId) {
       return userRepository.getUserById(userId);
   }
   @Override
   public List<LoginDTO> selectAllUsers() {
      return userRepository.selectAllUsers();
   }//23/11/21어드민 추가
   
   
   @Override
   public LoginDTO getLoginDTO(String userId) {
		// TODO Auto-generated method stub
		return userRepository.getLoginDTO(userId);
	}
   
   @Override
   public int updateUser(LoginDTO loginDTO) {
      // TODO Auto-generated method stub
      return userRepository.update(loginDTO);
   }
   @Override
   public int updateUserImg(LoginDTO loginDTO) {
      // TODO Auto-generated method stub
      return userRepository.updateUserImg(loginDTO);
   }
   @Override
   public int deleteUser(LoginDTO loginDTO) {
      // TODO Auto-generated method stub
      return userRepository.delete(loginDTO);

   }

   @Override
   public String selectHeat(String sell_code) {
      return userRepository.selectHeat(sell_code);
   }

   @Override
   public int updateHeat(String user_heat, String user_code) {
      System.out.println("서비스에서 보기" + user_heat + "@@@@@@@@@" + user_code);
      return userRepository.updateHeat(user_heat, user_code);
   }

   @Override
   public String selectHeatU(String sell_code) {
      return userRepository.selectHeatU(sell_code);
   }
   
   @Override
   public void saveHeat(String user_code, String user_heat,String check_heat,String board_id) {
      userRepository.saveHeat(user_code, user_heat,check_heat,board_id);
   }
      @Override
      public List<Object> getHeatByUserCode(String user_code){
         return userRepository.getHeatByUserCode(user_code);
      }
      
      @Override
      public List<Object>  getCheckHeatByUserCode(String sell_code) {
         return userRepository.getCheckHeatByUserCode(sell_code);
      }      
      
      @Override
      public String getCheckHeatByBoardId(String board_id) {
         return userRepository.getCheckHeatByBoardId(board_id);
      }
      

}