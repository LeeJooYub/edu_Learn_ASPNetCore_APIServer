# ���� ���μ��� ���̾�׷�
```mermaid
sequenceDiagram
    participant Client
    participant ShopController
    participant CheckUserAuth(Middleware)
    participant IShopService(ShopService)
    participant IMemoryDb
    participant IGameDb

    Client->>ShopController: POST /contents/shop/buy (BuyRequest)
    ShopController->>CheckUserAuth(Middleware): ����/��ū �˻�
    CheckUserAuth(Middleware)->>IMemoryDb: GetUserAsync(uid)
    CheckUserAuth(Middleware)-->>ShopController: ���� ����
    ShopController->>IShopService(ShopService): BuyItem(accountUid, shopId)
    IShopService->>IGameDb: ���� �ڻ�/���� ���� ��ȸ
    IShopService->>IMemoryDb: ���� ���� ����
    IShopService-->>ShopController: (Result, RewardInfo, UseAsset)
    ShopController-->>Client: BuyResponse
```  