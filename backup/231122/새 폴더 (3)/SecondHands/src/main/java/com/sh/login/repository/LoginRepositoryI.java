package com.sh.login.repository;

import java.util.List;

import com.sh.login.domain.LoginDTO;

public interface LoginRepositoryI {
   public boolean checklogin(LoginDTO loginDTO);

   List<LoginDTO> selectAllUsers();  // 추가
   LoginDTO getUserById(String userId); // 새로운 메소드 추가
  
   LoginDTO getLoginDTO(String userId);

   public int update(LoginDTO loginDTO);

   public int delete(LoginDTO loginDTO);
   
   public int updateUserImg(LoginDTO loginDTO);
   
   public String selectHeat(String sell_code);

   public String selectHeatU(String sell_code);

   int updateHeat(String user_heat, String user_code);

   void saveHeat(String user_code, String user_heat,String check_heat,String board_id);

      List<Object> getHeatByUserCode(String user_code);

      List<Object> getCheckHeatByUserCode(String sell_code);

   String getCheckHeatByBoardId(String board_id);
}