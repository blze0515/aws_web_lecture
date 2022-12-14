package com.ezen.springboard.oauth.provider;

//여러가지 소셜로그인 대응하기 위해서 Interface로 선언
public interface OAuth2UserInfo {
	String getProviderId();
	String getProvider();
	String getEmail();
	String getName();
}
