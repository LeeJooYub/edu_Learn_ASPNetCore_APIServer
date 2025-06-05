using Microsoft.AspNetCore.Mvc;

namespace HearthStoneWeb.Models.Game;



public class HSGameUserInfo
{ 
    public Int64 AccountUid { get; set; }
    public int Hp { get; set; }
    public int Mana { get; set; }
}

public class HSGameInfo
{
    // �⺻ �ĺ� ����
    public Guid MatchGUID { get; set; }
    public int MatchType { get; set; } = 0; // 0: pvp, 1: pve

    // ���� ���� ����
    public DateTime StartTime { get; set; }
    public DateTime LastActionTime { get; set; } = DateTime.UtcNow;
    public Int64 CurrentTurnUid { get; set; }
    public int TurnCount { get; set; } = 0;

    // �÷��̾� ����
    public List<HSGameUserInfo> GameUserList { get; set; }

    // ���� ���� ����
    public bool IsGameOver { get; set; } = false;
    public Int64? WinnerUid { get; set; } = null;

    // ���� ��ȯ �޼��� - Ŭ���̾�Ʈ�� ������ HSGameState�� ��ȯ
    public HSGameState ToGameState()
    {
        return new HSGameState
        {
            MatchGUID = this.MatchGUID,
            Players = this.GameUserList,
            CurrentTurnUid = this.CurrentTurnUid,
            IsGameOver = this.IsGameOver,
            WinnerUid = this.WinnerUid,
            LastActionTime = this.LastActionTime,
            TurnCount = this.TurnCount
        };
    }
}
public class InitGameRequest
{
    public Guid MatchGUID { get; set; }
}
    public class InitGameResponse : ErrorCodeDTO
{
    public Dictionary<int, CardInfo> InitialCardList { get; set; }
}

public class ReplaceCardsRequest
{
    public Guid MatchGUID { get; set; }
    public Dictionary<int, CardInfo> ReplaceCardIndexList { get; set; } // ��ü�� ī�� �ε���
}
public class ReplaceCardsResponse : ErrorCodeDTO
{
    public List<int> InitialCardList { get; set; }
}
// GameState ������ ���� DTO �߰�
public class GameStateRequest 
{
    public Guid MatchGuid { get; set; }
}
public class GameStateResponse : ErrorCodeDTO
{
    public HSGameState GameState { get; set; }
    public HSPlayerState PlayerState { get; set; }
    public HSOpponentState OpponentState { get; set; }
}

public class HSGameState
{
    public Guid MatchGUID { get; set; }
    public List<HSGameUserInfo> Players { get; set; }
    public Int64 CurrentTurnUid { get; set; }
    public bool IsGameOver { get; set; }
    public Int64? WinnerUid { get; set; }
    public DateTime LastActionTime { get; set; }
    public int TurnCount { get; set; }
}

// ���� ���� ��û�� ���� DTO
public class FinishGameRequest
{
    public Guid MatchGUID { get; set; }
    public Int64? WinnerUid{get;set;}
}

public class FinishGameResponse : ErrorCodeDTO
{
    public Int64? WinnerUid { get; set; }
}

// ī�� ��ο� ����
public class DrawCardRequest
{
    public Guid MatchGUID { get; set; }
}

public class DrawCardResponse : ErrorCodeDTO
{
    public CardInfo? DrawnCard { get; set; }
}

// ī�� ��� ����
public class PlayCardRequest
{
    public Guid MatchGUID { get; set; }
    public int CardId { get; set; }
}

public class PlayCardResponse : ErrorCodeDTO
{
    public bool Success { get; set; }
}

// ���� ����
public class AttackRequest
{
    public Guid MatchGUID { get; set; }
    public int AttackerCardId { get; set; }
    public int TargetCardId { get; set; }
}

public class AttackResponse : ErrorCodeDTO
{
    public bool Success { get; set; }
    public int DamageDealt { get; set; }
}

// �� ���� ����
public class EndTurnRequest
{
    public Guid MatchGUID { get; set; }
}

public class EndTurnResponse : ErrorCodeDTO
{
    public Int64 NextTurnUid { get; set; }
}

public class HSPlayerState
{
    public Int64 AccountUid { get; set; }
    public Dictionary<int, CardInfo> HandCardList { get; set; } = new Dictionary<int, CardInfo>();
    public Dictionary<int, CardInfo> FieldCardList { get; set; } = new Dictionary<int, CardInfo>();
    public int DeckCount { get; set; }
    public bool HasDrawnCardThisTurn { get; set; } = false;
    public List<int> AttackCardList { get; set; } = new List<int>(); // �̹��Ͽ��� �����߾��� ī��
    public List<int> UseCardList { get; set; } = new List<int>(); // ������� ������ ������ ī��

    public HSOpponentState ToHSOppentState()
    {
        return new HSOpponentState
        {
            AccountUid = this.AccountUid,
            FieldCardList = this.FieldCardList,
            DeckCount = this.DeckCount
        };
    }
}

public class HSOpponentState
{
    public Int64 AccountUid { get; set; }
    public Dictionary<int, CardInfo> FieldCardList { get; set; } = new Dictionary<int, CardInfo>();
    public int DeckCount { get; set; }
}
public class HSGameResult
{
    public Guid MatchGUID { get; set; }
    public int MatchType { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    public List<Int64> PlayerUIDs { get; set; }
    public Int64? WinnerUid { get; set; }
    public int TurnCount { get; set; }
    public bool IsGameOver { get; set; }
}
