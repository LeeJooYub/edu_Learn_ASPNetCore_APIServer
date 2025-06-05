# �α׾ƿ� ���μ��� ���̾�׷�
```mermaid
sequenceDiagram
    participant Client
    participant LogOutController
    participant CheckUserAuth(Middleware)
    participant IAuthService(AuthService)
    participant IMemoryDb

    Client->>LogOutController: POST /auth/logout (LogOutRequest)
    LogOutController->>CheckUserAuth(Middleware): ����/��ū �˻�
    CheckUserAuth(Middleware)-->>LogOutController: ���� ����
    LogOutController->>IAuthService(AuthService): LogOut(accountUid)
    IAuthService->>IMemoryDb: ��ū/���� ����
    IAuthService-->>LogOutController: �α׾ƿ� ��� ��ȯ
    LogOutController-->>Client: LogOutResponse
```