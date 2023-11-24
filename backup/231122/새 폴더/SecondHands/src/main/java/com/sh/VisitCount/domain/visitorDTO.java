package com.sh.VisitCount.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class visitorDTO {
	private String visit_id;
	private Date date;
    private int count;
	
}
