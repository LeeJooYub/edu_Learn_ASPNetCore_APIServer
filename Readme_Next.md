# ASP.NET Core Web API 게임 서버 학습 자료 분석

본 문서는 저장소의 다양한 학습 자료를 분석하고 카테고리별로 정리한 내용입니다. 각 자료의 예상 학습 소요 시간과 유용성(★~★★★★)을 표기하여 학습자가 효율적으로 자료를 선택할 수 있도록 도움을 드립니다.


## 참고사항

* ★★★★: 필수 자료
* ★★★: 매우 유용한 자료
* ★★: 유용한 자료
* ★: 선택적 학습 자료

본 분석은 각 학습자료의 내용, 접근성, 최신성, 그리고 게임 API 서버 개발이라는 목적에 얼마나 부합하는지를 기준으로 평가되었습니다. 학습자의 배경지식과 경험에 따라 자료의 유용성은 달라질 수 있습니다.


## 사용 기술 스택
- **언어**: C#
- **프레임워크**: ASP.NET Core
- **데이터베이스**: MySQL, Redis
- **DB 연결**: SQLKata, Kata Execution (EF Core 사용하지 않음) , Cloud Structures (Redis 라이브러리)
- **로거**: ZLogger 
- **게임 서버 OS**: Linux
- **기타 기술**: Docker, nGrinder, 프로메테우스 & 그라파나
- **클라이언트 테스트**: C# Blazor (후순위)

## 목차
1. [초급 학습자 추천 경로](#초급-학습자-추천-경로)
2. [C# 프로그래밍 기초](#c-프로그래밍-기초)
3. [ASP.NET Core 기초](#aspnet-core-기초)
4. [데이터베이스 연동 (MySQL)](#데이터베이스-연동)
5. [Redis 활용](#redis-활용)
6. [로깅 (ZLogger)](#로깅-및-모니터링)
7. [Docker 및 배포](#환경-설정-및-배포)
8. [모니터링 (프로메테우스, 그라파나)](#api-서버-고급-기능)
9. [참고 프로젝트](#참고-프로젝트)
10. [기타 학습 자료](#기타-학습-자료)

## 초급 학습자 추천 경로

ASP.NET Core로 게임 API 서버를 개발하기 위한 학습 경로를 다음과 같이 추천합니다.  
직접 실습해야할 부분은, 실습을 해보면서 프로젝트를 진행해 나가길 추천합니다.:

0. **게임 서버 기초 (약 5시간)**
   - [Web서비스의 서버구성과목적](https://docs.google.com/presentation/d/105NPfv7CPfgk0Iw_6vSB_oOavQZpes7-Wit5HuCm7oM/edit?usp=sharing) (★★★★, 2시간) - 전반적인 서버 구조 이해
   - [전체적인 서버 개발 기초 자료(기존 서버 캠퍼스 인턴 자료)](https://sueshin.tistory.com/category/%EA%B0%9C%EC%9D%B8%EA%B3%B5%EB%B6%80/Web%20API%20%EA%B2%8C%EC%9E%84%20%EC%84%9C%EB%B2%84%20%EA%B3%B5%EB%B6%80) (★★★★, 6시간) - 전체적인 서버 개발 기초 자료. 

1. **C# 프로그래밍 기초 (약 5시간)**
   - [(인프런 무료 영상) C# 처음부터 배우기](https://www.inflearn.com/course/%EC%B2%98%EC%9D%8C%EB%B6%80%ED%84%B0-%EB%B0%B0%EC%9A%B0%EB%8A%94-c) (★★★★, 4시간) - C# 기초 학습
 
2. **ASP.NET Core 기본 (약 8시간)**
   - [(YOUTUBE) 1~6단계로 ASP.NET Core 기본 실습](https://www.youtube.com/playlist?list=PLedRhbB5WC0g2_FjR9PryzsHuQeXpK1Nz) (★★★★, 2시간 30분) - ASP.NET Core의 기본 개념과 실습
   - [VSCode 게임 웹서버 환경설정](UsingVSCode.md) (★★★★, 1시간) - VSCode에서 ASP.NET Core의 환경 설정 및 디버깅 방법
   - [ASP.NET Core Web 시작](https://blog.naver.com/sssang97/223088811266) (★★★★, 30분) - 기본 시작 방법
   - [의존성 주입 방법의 라이프 사이클 - AddTransient, AddScoped, AddSingleton](https://docs.google.com/document/d/e/2PACX-1vRFi_2Z6yMOWNwWfILDXGsbqYS3aJfiO6aO2u22Awy-pQ5XEEz0GpIOjehif47noYsR06jT6z_pD6Mr/pub) (★★★★, 20분) - DI 생명주기
   - [API 서버의 디렉토리 구성](APIServer_Directory.md) (★★★★, 30분) - ASP.NET Core API 서버 디렉토리 구성 예
   - [API 서버간 통신 떄 HttpClientFactory 사용하기](HttpClientFactory.md) (★★★★, 2시간분) -  HttpClientFactory 사용법

3. **데이터베이스 (약 4시간)**
   - [MySqlConnector 간단 정리](https://gist.github.com/jacking75/51a1c96f4efa1b7a27030a7410f39bc6) (★★★, 1시간 30분) - MySQL 연결 방법
   - [DB 프로그래밍 라이브러리 SqlKata 소개](https://docs.google.com/document/d/e/2PACX-1vTnRYJOXyOagNhTdhpkI_xOQX4DlMu0TRcC9Ehew6wraufgEtBuQiSdGpKzaEmRb-jfsLv43i0nBQsp/pub) (★★★★, 2시간) - 쿼리 빌더 라이브러리
   - [예제 프로그램: github_sqlkata_demo.zip](https://drive.google.com/file/d/1FBpB1zQ84LqGOA9WAJ6vk5S3453ekqDc/view?usp=sharing) (★★★) - SQLKata 예제

4. **Redis학습 (약 4시간)**
   - [Redis 기능 학습하기](http://redisgate.kr/redis/introduction/redis_intro.php) (★★★, 4시간) - 잘 구조화된 Redis 학습 자료

5. **Redis 라이브러리 CloudStructure 학습 (약 6시간)**
   - [CloudStructures 라이브러리 사용 설명서](./redis_CloudStructures_Docs) (★★★★, 4시간) - C#에서 Redis 사용 

6. **로깅 (ZLogeer, SeriLog중 택 1. 약 3시간)**
   - [ZLogger 사용하기](./ZLogger/) (★★★★, 2시간) - 로그 라이브러리 ZLogger 사용 방법
   - [SeriLog 사용하기](./Serilog.md) (★★★★, 2시간) - ZLogger 대체 로깅 라이브러리

## ASP.NET Core 기초

### 필수 자료
1. [(YOUTUBE) 1~6단계로 ASP.NET Core 기본 실습](https://www.youtube.com/playlist?list=PLedRhbB5WC0g2_FjR9PryzsHuQeXpK1Nz) (★★★★, 2시간 30분) - 기초부터 차근차근 배우기에 가장 적합한 자료
2. [ASP.NET Core Web 시작](https://blog.naver.com/sssang97/223088811266) (★★★, 30분) - 기본 시작 방법
3. [ASP.NET Core 입문 – 미들웨어와 파이프라인 해설](https://docs.google.com/document/d/e/2PACX-1vRsqcyeBi--VYCPwQlhW9LsAyYUKSuuh80_BiSgnNnrfULsZFgz3i_Bj8nGG6dl-Q6NEiKBjhGx2bJ6/pub) (★★★, 2시간) - 미들웨어 개념 이해
4. [ASP.Net Core - DI 시스템 사용하기](https://docs.google.com/document/d/e/2PACX-1vR0NxfIPIQe_CAxf2-yo9B9QB4O0NIlJz3U-oe4iF_sHIpMnJiu_4o3ZlWoPD0kcW9ve9ka49_sLa8u/pub) (★★★, 30분) - 의존성 주입
5. [의존성 주입 방법의 라이프 사이클 - AddTransient, AddScoped, AddSingleton](https://docs.google.com/document/d/e/2PACX-1vRFi_2Z6yMOWNwWfILDXGsbqYS3aJfiO6aO2u22Awy-pQ5XEEz0GpIOjehif47noYsR06jT6z_pD6Mr/pub) (★★★★, 20분) - DI 생명주기
6. [VSCode 게임 웹서버 환경설정.md](./UsingVSCode.md) (★★★★) - VS Code에서 .NET API 서버 구축 방법

7. [API 서버의 디렉토리 구성](APIServer_Directory.md) (★★★★, 30분) - ASP.NET Core API 서버 디렉토리 구성 예
8. [API 서버간 통신 떄 HttpClientFactory 사용하기](HttpClientFactory.md) (★★★★, 30분) -  HttpClientFactory 사용법


### 참고 자료
1. [닷넷 빌드와 실행](./dotnet_build.md) (★★, 40분) - 닷넷 빌드와 실행 시 일어나는 일에 대한 상세 설명
2. [ASP.NET Core](https://learn.microsoft.com/ko-kr/aspnet/core) (★★, 5시간) - 공식 사이트로 방대한 정보 포함 
3. [ASP.NET Core 애플리케이션 최소 구현 치트 시트](https://jacking75.github.io/csharp_netcore_cheatsheet/) (★★, 1시간 30분) - 최소 구현을 위한 환경 설정


## C# 프로그래밍 기초

### 필수 자료
1. [(인프런 무료 영상) C# 처음부터 배우기](https://www.inflearn.com/course/%EC%B2%98%EC%9D%8C%EB%B6%80%ED%84%B0-%EB%B0%B0%EC%9A%B0%EB%8A%94-c) (★★★★, 4시간) - C# 기초 학습

### 참고 자료
1. [C# 비동기 프로그래밍 정리](https://docs.google.com/document/d/e/2PACX-1vRHRbQjeoJH9lXalTClFBuB-D41v9TaBTPc_TeUS-yKhPZTJa2dWjpv_Rib863b_disjspqymOjgKwq/pub) (★★★, 6시간) - 비동기 프로그래밍 필수 자료
2. [(인프런 무료 영상) C# 초보 강좌 예제로 배우는 C#](https://www.inflearn.com/course/c-sharp-learning-by-doing) (★★, 8시간) - 예제 중심 C# 학습
3. [문법](https://www.csharpstudy.com/CSharp/CSharp-intro.aspx) (★★) - C# 기본 문법 학습
4. [(YOUTUBE) VisualAcademy](https://www.youtube.com/@VisualAcademy/videos) (★★) - 다양한 C# 강의 모음

## 데이터베이스 연동

### 필수 자료
1. [DB 프로그래밍 라이브러리 SqlKata 소개](https://docs.google.com/document/d/e/2PACX-1vTnRYJOXyOagNhTdhpkI_xOQX4DlMu0TRcC9Ehew6wraufgEtBuQiSdGpKzaEmRb-jfsLv43i0nBQsp/pub) (★★★★, 2시간) - 쿼리 빌더 라이브러리
2. [코드에서 DB 트랜잭션 하기](./how_to_db_transaction.md) (★★★★, 1시간) - 트랜잭션 처리
3. [DAO, DTO, VO 란? 간단한 개념 정리](https://melonicedlatte.com/2021/07/24/231500.html) (★★★, 30분) - 기본 개념 이해
4. [데이터 설계](https://sueshin.tistory.com/category/%EA%B0%9C%EC%9D%B8%EA%B3%B5%EB%B6%80/Web%20API%20%EA%B2%8C%EC%9E%84%20%EC%84%9C%EB%B2%84%20%EA%B3%B5%EB%B6%80) (★★★★, 6시간) - 전체적인 서버 개발 기초 자료
5. [MySqlConnector 간단 정리](https://gist.github.com/jacking75/51a1c96f4efa1b7a27030a7410f39bc6) (★★, 1시간 30분) - MySQL 연결 방법
6. [예제 프로그램: github_sqlkata_demo.zip](https://drive.google.com/file/d/1FBpB1zQ84LqGOA9WAJ6vk5S3453ekqDc/view?usp=sharing) (★★) - SQLKata 예제

### 참고 자료


## Redis 활용

### 필수 자료
1. [Redis의 기본 데이터 유형 및 명령](https://docs.google.com/document/d/10mHFq-kTpGBk1-id5Z-zoseiLnTKr_T8N3byBZP5mEg/edit?usp=sharing) (★★★★, 1일) - 기본적인 Redis 지식
2. [CloudStructures 라이브러리 사용 설명서](./redis_CloudStructures_Docs) (★★★★, 하루) - C#에서 Redis 사용

### 참고 자료
1. [CloudStructures - Redis 라이브러리 소개](https://jacking75.github.io/NET_lib_CloudStructures/) (★★, 4시간) - C# Redis 라이브러리
2. [CloudStructures를 이용한 C# Redis 프로그래밍](https://gist.github.com/jacking75/5f91f8cf975e0bf778508acdf79499c0) (★★, 4시간) - 예제 중심 Redis 사용법
3. [Cache-Aside_pattern.md](./Cache-Aside_pattern.md) (★★★) - 캐싱 패턴 이해

## 로깅 및 모니터링

### 필수 자료
1. [ZLogger 디렉토리](./ZLogger/) (★★★★) - 로그 라이브러리 ZLogger 사용 방법
2. [SeriLog 사용하기](./Serilog.md) (★★★★) - ZLogger 대체 로깅 라이브러리
3. [ASP.NET Core 프레임워크 내부의 로그 수준 설정하기](https://docs.google.com/document/d/e/2PACX-1vRN7e0qnQE9gC780ddPfIojCnVUhd7mf-uYk6oRIibo_nEbs3HWJe8-61jDAiel37AQxe8BxKjb58-l/pub) (★★★, 40분) - 로그 레벨 설정

### 참고 자료
1. [fluentd 디렉토리](./fluentd/) (★★) - 로그 수집 시스템
2. [prometheus_grafana 디렉토리](./prometheus_grafana/) (★★) - 모니터링 시스템

## 환경 설정 및 배포

### 필수 자료
1. [Microsoft.Extensions.Configuration 및 Microsoft.Extensions.Options 사용 시작](https://docs.google.com/document/d/12OwjWyzMwYWMWi9LEZEvgE2gjx-aGWP17f2Pw_z1S4o/pub) (★★★★, 1시간 30분) - 설정 읽는 방법
2. [ASP.NET Core에서 여러 환경 사용](https://docs.microsoft.com/ko-kr/aspnet/core/fundamentals/environments) (★★★, 2시간) - 환경별 설정

### 참고 자료
1. [Microsoft.Extensions.Configuration.Json에서 읽은 설정 값에 Prefix 부여](https://docs.google.com/document/d/e/2PACX-1vQbK6RbrkoyhQDL1u1_8_ZQ02Dsqhkdv3WHj2UHY8SyuM5fgOy3RtIZ2B2f0iFtMqySU-dCZKjAsd4Y/pub) (★★, 40분) - 설정 관련 팁
2. [C#(.NET) 이미 빌드 된 API 서버의 엔드 포인트 url을 변경하는 방법](https://docs.google.com/document/d/e/2PACX-1vRhHebXWTa1OOY60NT3T0ZRkr8NMNRIuFADhVZIknSs_YsnlYTz7FObkexo9x1iNfoQID31-hVxiwTB/pub) (★★, 10분) - 배포 후 설정
3. [.NET 6에서 Kestrel 포트를 설정하는 몇가지 방법](https://forum.dotnetdev.kr/t/net-6-kestrel-bryan-hogan/2681) (★★, 20분) - 포트 설정
4. [ASP.NET Core 앱에서 URL을 설정하는 5가지 방법](https://docs.google.com/document/d/1x3ZJQtGt2uNW5_xRT6QHrOmZkfbNU2KQ23N5RCLi4cE/edit?usp=sharing) (★★★, 30분) - URL 설정
5. ["Docker Desktop for Windows" - ASP.NET Core 응용 프로그램의 소켓 주소 바인딩](https://www.sysnet.pe.kr/2/0/13548) (★, 30분) - Docker 설정
6. [docker 디렉토리](./docker/) (★) - Docker 관련 예제 및 설명


## API 서버 고급 기능

### 필수 자료
2. [ASP.NET Core에서 호스팅되는 서비스를 사용하는 백그라운드 작업](https://docs.microsoft.com/ko-kr/aspnet/core/fundamentals/host/hosted-services?tabs=visual-studio&utm_source=pocket_mylist&view=aspnetcore-6.0) (★★★, 1시간) - 백그라운드 작업
3. [ASP.NET Core 출력 캐싱 미들웨어](https://learn.microsoft.com/ko-kr/aspnet/core/performance/caching/output?view=aspnetcore-7.0) (★★★, 2시간) - 성능 최적화

### 참고 자료
1. [ASP.NET Core의 속도 제한 미들웨어](https://learn.microsoft.com/ko-kr/aspnet/core/performance/rate-limit?preserve-view=true&view=aspnetcore-7.0) (★★, 2시간) - DDoS 방지
2. [요청 본문을 Stream 또는 PipeReader로 바인딩](https://learn.microsoft.com/ko-kr/aspnet/core/fundamentals/minimal-apis?view=aspnetcore-7.0#rbs) (★★, 2시간) - 대용량 파일 처리
3. [.NET Core3.1에서 CORS 설정하기](https://docs.microsoft.com/ko-kr/aspnet/core/security/cors?view=aspnetcore-7.0) (★★, 20분) - CORS 설정
4. [ASP.NET Core에서 API 별 버전 관리](https://docs.google.com/document/d/1XMqTausAUspWr0GLXMkdLpX-vE4uDnQj0JZ3Fmi61-Y/edit?usp=sharing) (★★, 1시간) - API 버전 관리

## 참고 프로젝트


1. [미니 게임 천국](https://github.com/LeeJooYub/edu_Learn_ASPNetCore_APIServer/tree/main/codes/practice_MiniGameHeavenAPIServer) (★★★★) - 가장 추천되는 참고 프로젝트
2. [api_server_training_dungeon_farming](./api_server_training_dungeon_farming/) (★★★★) - 완성된 API 서버 프로젝트
3. [지니 팜](https://github.com/jacking75/com2us_edu_GenieFarm) (★★★) - 인턴 프로젝트

## 참고 자료

### 인턴 자료
2. [학습자료_2022년_인턴 폴더](./학습자료_2022년_인턴/) (★★★) - 인턴 학습 자료
3. [practical-aspnetcore](https://github.com/dodyg/practical-aspnetcore) (★★, 일주일) - 다양한 예제 코드 모음
4. [코드 디렉토리](./codes/) (★★) - 다양한 예제 프로젝트 모음

## 기타 학습 자료

### 성능 테스트
1. [nGrinder 소개 및 사용 방법](https://docs.google.com/document/d/1O-xeZ-bw8LimZT_WDK294aUXcLBRs7XYWgbgV4NiHK0/edit) (★★★) - 성능 테스트 도구

### 네트워크 및 통신
1. [통신](https://gist.github.com/jacking75/344fd3c8c16fc27fe51d4c983a3a6306) (★★★, 1시간 50분) - 네트워크 기초 지식
2. [모바일 게임 개발 개요](https://velog.io/@oak_cassia/%EC%84%9C%EB%B2%84%EC%BA%A0%ED%8D%BC%EC%8A%A4-1%EA%B8%B0-ASP.NET-Core) (★★★, 1시간 20분) - 게임 서버 개발자 기초

### 코딩 규칙
1. [coding_rule.md](./coding_rule.md) (★★★) - 코딩 규칙 및 가이드라인

---

## LinqPad 관련 자료

1. [LinqPad 소개](https://docs.google.com/presentation/d/1THcgeub4cNRJdFCxHatpxkPR0AhYJay55P5xxZ1sgtE/edit?usp=sharing) (★★★, 1시간) - LinqPad 기본 사용법
2. [LinqPad 무료 버전에서 nuget 사용하기](https://docs.google.com/document/d/1Hn8WDZxkX5os86DZANeHS4ggeqq6NWD67QbfigawJuM/edit?usp=sharing) (★★★, 30분) - NuGet 패키지 관리
