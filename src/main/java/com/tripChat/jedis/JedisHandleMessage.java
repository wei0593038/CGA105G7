package com.tripChat.jedis;

import java.util.List;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisHandleMessage {
	
	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	
	public static void saveChatMessage(String tripId , String msg) {
		Jedis jedis = pool.getResource();
		jedis.rpush(tripId+":",msg);
		jedis.close();
	}
	
	public static List<String> getHistoryMsg(String tripId){
		String key = new StringBuilder(tripId).append(":").toString();
		Jedis jedis = null;
		jedis = pool.getResource();
		List<String> historyData = jedis.lrange(key, 0, -1);
		jedis.close();
		return historyData;
	}
}
