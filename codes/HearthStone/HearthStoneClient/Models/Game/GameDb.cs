using System;
using System.Collections.Generic;
using System.Linq;

namespace HearthStoneWeb.Models.Game;



public class GdbUserInfo
{
    public long account_uid { get; set; }
    public int main_deck_id { get; set; }
    public DateTime last_login_dt { get; set; } // ����: create_dt -> last_login_dt
}

public class GdbDeckInfo
{
    public long account_uid { get; set; } // �߰�: PK�� �Ϻ�
    public int deck_id { get; set; } // get�� �־��µ� set�� �߰�
    public string deck_list { get; set; } // get�� �־��µ� set�� �߰�
    public DateTime create_dt { get; set; } // get�� �־��µ� set�� �߰�
}

public class DeckInfo
{
    public int item_id { get; set; }
}

public class Deck
{
    public Deck() 
    {
        deck_list = new List<DeckInfo>();
    }

    public Deck(int deckId)
    {
        deck_id = deckId;
        deck_list = new List<DeckInfo>();
    }

    public Deck(int deckId, string deckString)
    {
        deck_id = deckId;
        deck_list = new List<DeckInfo>();

        if (!string.IsNullOrEmpty(deckString))
        {
            string[] deckStringList = deckString.Split(',');
            for (int i = 0; i < deckStringList.Length; i++)
            {
                DeckInfo deckInfo = new DeckInfo();
                deckInfo.item_id = int.Parse(deckStringList[i]);
                deck_list.Add(deckInfo);
            }
        }
    }
    public string GetDeckList()
    {
        if (deck_list == null || deck_list.Count == 0)
            return string.Empty;

        return string.Join(",", deck_list.Select(deck => deck.item_id));
    }

    // ī�� �߰� �޼���
    public bool AddCard(int itemId)
    {
        // �� ũ�� ����(��: �ִ� 10��)
        if (deck_list.Count >= 10)
            return false;

        // �̹� �����ϴ� ī������ Ȯ��(�ɼ�)
        if (deck_list.Any(d => d.item_id == itemId))
            return false;

        var deckInfo = new DeckInfo { item_id = itemId };
        deck_list.Add(deckInfo);
        return true;
    }

    // ī�� ���� �޼���
    public bool RemoveCard(int itemId)
    {
        int index = deck_list.FindIndex(d => d.item_id == itemId);
        if (index != -1)
        {
            deck_list.RemoveAt(index);
            return true;
        }
        return false;
    }
    public int deck_id { get; set; }
    public List<DeckInfo> deck_list { get; set; }
}

public class GdbUserAssetInfo
{
    public long account_uid { get; set; } // �߰�: PK�� �Ϻ�
    public string asset_name { get; set; }
    public long asset_amount { get; set; }
}

public class AssetInfo : GdbUserAssetInfo
{
}

public class GdbAttendanceInfo
{
    public long account_uid { get; set; } // �߰�: PK�� �Ϻ�
    public int event_id { get; set; } // ��ġ
    public int attendance_no { get; set; } // ����: attendance_count -> attendance_no
    public DateTime attendance_dt { get; set; } // �߰�: DB �÷� ����
}

public class AttendanceInfo : GdbAttendanceInfo
{
}

public class GdbItemInfo
{
    public long account_uid { get; set; } // �߰�: PK�� �Ϻ�
    public int item_id { get; set; } // ����: string -> int
    public int item_cnt { get; set; } // ����: count -> item_cnt
}

public class ItemInfo : GdbItemInfo
{
}

public class GdbMailInfo
{
    public long account_uid { get; set; } // �߰�: PK�� �Ϻ�
    public long mail_id { get; set; } // ����: string -> long (BIGINT)
    public int status { get; set; }
    public int reward_key { get; set; }
    public string mail_desc { get; set; }
    public DateTime received_dt { get; set; } // ����: string -> DateTime
    public DateTime expire_dt { get; set; } // ����: string -> DateTime
}

public class MailInfo : GdbMailInfo
{
}
