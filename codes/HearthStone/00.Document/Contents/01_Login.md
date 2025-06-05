# ���̺� �α��� ���μ��� ���̾�׷�
```mermaid
sequenceDiagram
    participant Client as Ŭ���̾�Ʈ
    participant HiveServer as HiveServer
    participant GameServer as GameServer
    participant Redis as Redis
    participant HiveDB as Hive DB
    participant GameDB as Game DB

    %% �α��� ��û ����
    Client->>HiveServer: HTTP POST /Auth/Login<br/>(EmailID, Password)
    activate HiveServer
    %% HiveServer���� �α��� ó��
    HiveServer->>HiveDB: ���� ���� ��ȸ
    activate HiveDB
    HiveDB-->>HiveServer: ����� ���� ��ȯ
    deactivate HiveDB
    %% ��й�ȣ ���� �� ��ū ����
    HiveServer->>HiveServer: ��й�ȣ ����
    HiveServer->>HiveServer: HiveToken ����
    HiveServer->>Redis: HiveToken ����
    HiveServer-->>Client: LoginResponse<br/>(AccountUid, HiveToken)
    deactivate HiveServer

    %% GameServer ���� ����
    Client->>GameServer: HTTP POST /Auth/Login<br/>(AccountUid, HiveToken)
    activate GameServer
    %% GameServer���� HiveServer ��ū ����
    GameServer->>HiveServer: VerifyToken(AccountUid, HiveToken)
    activate HiveServer
    HiveServer->>Redis: ��ū ����
    HiveServer-->>GameServer: ���� ���
    deactivate HiveServer

    alt ��ū ���� ����
        GameServer-->>Client: �α��� ����<br/>(ErrorCode.HiveTokenInvalid)
    else ��ū ���� ����
        %% ���� ��ū ����
        GameServer->>GameServer: ���� ��ū ����
        GameServer->>Redis: ���� ��ū ����
        
        %% ����� ���� Ȯ��
        GameServer->>GameDB: ���� ���� ���� ��ȸ
        activate GameDB
        GameDB-->>GameServer: ����� ���� ��ȯ
        deactivate GameDB
        
        %% �α��� �ð� ����
        GameServer->>GameDB: �ֱ� �α��� �ð� ����
        GameServer-->>Client: LoginResponse<br/>(Token, AccountUid)
        
        %% ���� ������ �ε�
        Client->>GameServer: HTTP POST /contents/dataload
        GameServer->>GameDB: ����� ���� ������ �ε�
        activate GameDB
        GameDB-->>GameServer: ���� ������ ��ȯ<br/>(ItemList, CurrencyList, DeckList ��)
        deactivate GameDB
        GameServer-->>Client: DataLoadResponse
        
        %% Ŭ���̾�Ʈ ������ ���� �� ���� ȭ�� �̵�
        Client->>Client: ���� �� ���� ������ ����
        Client->>Client: ���� ȭ������ �̵�
    end
```  