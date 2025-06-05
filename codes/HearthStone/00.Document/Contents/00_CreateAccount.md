# ȸ������ ���μ��� ���̾�׷�
```mermaid
sequenceDiagram
    actor Client
    participant HiveServer
    participant Redis
    participant HiveDB
    
    %% ���� ���� ��û
    Client->>HiveServer: ȸ������ ��û<br/>(�̸���, ��й�ȣ, �г���)
    activate HiveServer
    
    %% ��й�ȣ �ؽ� �� ���� ����
    HiveServer->>HiveServer: ��й�ȣ �ؽ�<br/>��Ʈ �� ����
    HiveServer->>HiveDB: �̸��� �ߺ� Ȯ��
    activate HiveDB
    HiveDB-->>HiveServer: ��� ��ȯ
    
    alt �̸����� �̹� ������
        HiveServer-->>Client: ȸ������ ����<br/>(ErrorCode.CreateAccountFail)
    else �г����� �������
        HiveServer->>HiveServer: �г��� ����
        HiveServer-->>Client: ȸ������ ����<br/>(ErrorCode.CreateUserFailNoNickname)
    else �г��� �ߺ�
        HiveServer->>HiveDB: �г��� �ߺ� Ȯ��
        HiveDB-->>HiveServer: �ߺ� �г��� �߰�
        HiveServer-->>Client: ȸ������ ����<br/>(ErrorCode.CreateUserFailDuplicateNickname)
    else ��ȿ�� ��û
        %% DB�� ���� ����
        HiveServer->>HiveDB: ���� ���� ��û
        HiveDB-->>HiveServer: ���� ����
        
        %% ��� ��ȯ
        HiveServer-->>Client: ȸ������ ����<br/>(ErrorCode.None)
        HiveServer->>Redis: ����� ���� ���� ����
        
        %% Ŭ���̾�Ʈ �����̷���
        Client->>Client: �α��� �������� �̵�
    end
    deactivate HiveDB
    deactivate HiveServer
```  