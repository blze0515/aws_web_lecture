# 1. Spring Security
1. Spring Security란?
- 스프링 시큐리티는 스프링 기반 어플리케이션의 보안(인증(로그인)과 권한(사용자의 권한에 대한 처리), 인가(권한에 따른 사용분리) 등)을 담당하는 스프링의 하위 프레임워크
- 주로 서블릿 필터와 필터체인으로 위임모델을 구성한다.(HttpSecurity 객체를 사용하여 필터체인을 구성)
- 보안관 관련된 체계적인 옵션을 많이 제공해주므로 개발자가 직접 보안관련 로직을 작성하지 않아도 된다.
2. Spring Security의 보안용어
- 접근 주체(Principal): 보호된 리소스(어플리케이션의 기능들)에 접근하는 대상
- 인증(Authentication): 보호된 리소스에 접근하는 대상(Principal)안에 이 유저가 누구인지, 어플리케이션의 기능을 사용할 수 있는 권한이 있는 주체인지를 확인하는 과정(로그인) 
- 인증토큰(Authentication Token): 인증과정으로 통해 발급되는 토큰. 토큰안에는 username(아이디), password, 권한이 셋팅된다.
- 인가(Authorize): 해당 리소스에 대한 접근이 허용된 권한인지 확인하는 과정
- 권한: 특정 리소스에 대한 접근 제한, 스프링 시큐리티 사용 시 모든 리소스는 접근 제한이 걸려있다. 인가 과정을 통해서
해당 리소스에 대한 권한을 가지고 있는 지 검사하고 권한이 있으면 해당 리소스를 사용할 수 있게 권한이 없으면 해당 리소스에
접근 못 하도록 설정
3. Spring Security의 로그인 인증 과정
  1) 사용자가 로그인 정보를 입력하고 인증 요청을 보낸다.
  2) AuthenticationFilter(구현체: UsernamePasswordAuthenticationFilter)가 사용자가 보낸 인증 요청을 인터셉한다.
     사용자가 입력한 아이디와 비밀번호에 대한 유효성 검사를 진행(null값이 들어왔는지). 유효성 검사가 끝난 후에는 
     AuthenticationManager(구현체: ProviderManager)에게 인증용 객체(UsernamePasswordAuthenticationToken)을 만들어서
     전달.
  3) 인증용 객체를 전달받은 ProviderManager는 실제 인증 과정이 발생할 AuthenticationProvider에게 인증용 객체를 전달.
  4) AuthenticationProvider에서 전달받은 인증용 객체로 실제 인증 과정을 처리.
  5) 실제 인증 과정1 - DB에서 사용자 인증 정보를 가져올 UserDetailService 객체에게 아이디를 넘겨주고 DB에서 인증에서 
                      사용할 사용자 정보(아이디, 패스워드, 권한 등)를 UserDetails객체를 AuthenticationProvider객체로
                      리턴.
                      UserDetails findByUsername();
  6) 실제 인증 과정2 - AuthenticationProvider 다시 전달 받은 UserDetails 객체를 가지고 사용자가 입력한 정보와 비교, 
                      인증 처리를 시도.
                      인증이 완료되면 사용자 정보를 가지고 있는 Authentication 객체를 SecurityContextHolder에 등록
                      등록 후에는 AuthenticationSuccessHandler를 호출한다.
                      인증에 실패(로그인정보가 틀리거나 SecurityContextHolder에 등록하다가 에러가 발생 등)하면 AuthenticationFailureHandler 호출한다.
<p style="text-align: center;"><img src="images/Security 인증 처리 과정.PNG"></p>

4. Spring Security의 Filter들