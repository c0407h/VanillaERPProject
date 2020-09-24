package com.gd.vanilla.batch.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class BatchComponent {
	/*
	 * cron -> 초 분 시 일 월 요일 연도(생략가능)
	 * * -> 모든
	 * a-b -> a부터 b까지 매 1간격마다
	 * a/b -> a부터 매 b간격만큼 
	 */
	//구현 시 삭제할것
	@Scheduled(cron = "0 0 0 * * *")
	public void cronTest1() {
		System.out.println("batch!!");
	}

}
