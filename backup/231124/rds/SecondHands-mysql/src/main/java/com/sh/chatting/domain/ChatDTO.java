package com.sh.chatting.domain;

import lombok.Data;

@Data
public class ChatDTO {
    private String chat_code;
    private String buy_code;
    private String sell_code;
    private String board_id;
    private String board_Title;
    private String user_nickname;
    private String board_Price;
    private String board_Img;


}