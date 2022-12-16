package com.ezen.springboard.oauth;

import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.ezen.springboard.entity.CustomUserDetails;
import com.ezen.springboard.entity.User;
import com.ezen.springboard.oauth.provider.KakaoUserInfo;
import com.ezen.springboard.oauth.provider.OAuth2UserInfo;
import com.ezen.springboard.repository.UserRepository;

@Service
public class Oauth2UserService extends DefaultOAuth2UserService {
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserRepository userRepository;
	
	//토큰 발행 후 사용자 정보에 대한 처리
	//소셜 로그인 버튼 클릭 -> 사용자 동의 창 -> 사용자 동의 후 로그인 완료 -> code 값 리턴 ->
	//토큰수령 -> 토큰을 통해 사용자 정보 취득 -> loadUser 메소드 자동 호출 -> 사용자 정보를 커스터마이징
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) 
			throws OAuth2AuthenticationException {
		OAuth2User oAuth2User = super.loadUser(userRequest);
		Map<String, Object> temp = oAuth2User.getAttributes();
		
		Iterator<String> iter = temp.keySet().iterator();
		
		while(iter.hasNext()) {
			System.out.println(iter.next());
			System.out.println(userRequest.getAccessToken().getTokenValue());
		}
		
		String userName= "";
		String providerId = "";
		
		OAuth2UserInfo oAuth2UserInfo = null;
		
		//소셜카테고리 검증
		if(userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
			oAuth2UserInfo = new KakaoUserInfo(oAuth2User.getAttributes());
			providerId = oAuth2UserInfo.getProviderId();
			userName = oAuth2UserInfo.getName();
		} else {
			System.out.println("카카오 로그인만 지원합니다.");
		}
		
		String provider = oAuth2UserInfo.getProvider();
		//userId = kakao_1234212
		String userId = provider + "_" + providerId;
		String password = passwordEncoder.encode(oAuth2UserInfo.getName());
		String email = oAuth2UserInfo.getEmail();
		String role = "ROLE_USER";
		
		//사용자가 이미 소셜로그인한 기록이 있는지 검사할 객체
		User user;
		
		if(userRepository.findById(userId).isPresent()) {
			//이미 소셜 로그인한 기록이 존재하면
			//정보를 user 엔티티에 담아줌
			user = userRepository.findById(userId).get();
		} else {
			//소셜 로그인한 기록이 없으면
			//null로 리턴하여 회원가입 처리
			user = null;
		}
		
		//회원가입 처리
		if(user == null) {
			user = User.builder()
					   .userId(userId)
					   .userPw(password)
					   .userNm(userName)
					   .userMail(email)
					   .userRole(role)
					   .build();
			
			//추가 입력사항이 있으면 User 엔티티를 가지고
			//추가 입력 페이지로 이동
			//추가 입력 사항이 입력된 후 회원가입 처리
			userRepository.save(user);
		}
		
		
		//SecurityContext에 인증 정보 저장
		return CustomUserDetails.builder()
								.user(user)
								.attributes(oAuth2User.getAttributes())
								.build();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
