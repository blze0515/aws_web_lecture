package com.ezen.springboard.oauth.provider;

import java.util.Map;

public class KakaoUserInfo implements OAuth2UserInfo{
	Map<String, Object> attributes;
	Map<String, Object> properties;
	
	public KakaoUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
		this.properties = (Map<String, Object>)attributes.get("kakao_account");
	}

	@Override
	public String getProviderId() {
		// TODO Auto-generated method stub
		return attributes.get("id") + "";
	}

	@Override
	public String getProvider() {
		// TODO Auto-generated method stub
		return "kakao";
	}

	@Override
	public String getEmail() {
		// TODO Auto-generated method stub
		return properties.get("email") + "";
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		Map profile = (Map)properties.get("profile");
		return profile.get("nickname") + "";
	}
}
