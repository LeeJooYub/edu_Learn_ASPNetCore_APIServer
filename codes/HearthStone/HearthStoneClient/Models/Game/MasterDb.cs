using System;

namespace HearthStoneWeb.Models.Game;



public class MdbVersionInfo
{
    public int id { get; set; } // �߰�: AUTO_INCREMENT PRIMARY KEY
    public string app_version { get; set; } = "";
    public string master_data_version { get; set; } = "";
    public DateTime create_dt { get; set; } // �߰�: DEFAULT CURRENT_TIMESTAMP
}

public class MdbItemInfo
{
    public long item_id { get; set; } // ����: BIGINT
    public string item_grade_code { get; set; } = ""; // ����: quality -> item_grade_code (CHAR(2))
    public byte item_type { get; set; } // ����: string -> byte (TINYINT)
    public int ability_key { get; set; } // ����: string -> int (INT)
}

public class MdbAbilityInfo
{
    public int ability_key { get; set; } // ����: string -> int (INT)
    public string ability_type { get; set; } = "";
    public long ability_value { get; set; }
}

public class MdbGachaInfo
{
    public int gacha_key { get; set; } // ����: string -> int (INT)
    public int count { get; set; }
}

public class MdbGachaRateInfo
{
    public int gacha_key { get; set; } // ����: string -> int (INT)
    public int item_id { get; set; } // ����: string -> int (INT)
    public long rate { get; set; } // ����: int -> long (BIGINT)
}


public class MdbAttendanceInfo
{
    public int event_id { get; set; } // ��ġ: event_id
    public bool free_yn { get; set; } // ����: bool is_free -> char free_yn (CHAR(1))
}

public class MdbAttendanceRewardInfo
{
    public int day_seq { get; set; }
    public int event_id { get; set; } // ��ġ: event_id
    public int reward_key { get; set; } // ����: string -> int (INT)
}

public class MdbRewardInfo
{
    public int reward_key { get; set; } // ����: string -> int (INT)
    public string reward_class { get; set; } = "";
    public string reward_type { get; set; } = "";
    public long reward_value { get; set; }
}

public class MdbInitialFreeItem
{
    public int item_id { get; set; } // INT
    public int item_cnt { get; set; }
}

public class MdbInitialAsset
{
    public string asset_name { get; set; } = "";
    public long asset_amount { get; set; }
}

public class MdbMailInfo
{
    public long mail_id { get; set; } // ����: string -> long (BIGINT)
    public int status { get; set; }
    public int reward_key { get; set; }
    public string mail_desc { get; set; } = "";
    public DateTime received_dt { get; set; }
    public DateTime expire_dt { get; set; } // ����: expired_dt -> expire_dt
}
public class CardInfo
{
    public int ItemId { get; set; }
    public int Attack { get; set; }
    public int Hp { get; set; }
    public int ManaCost { get; set; }
}

public class ItemDetailInfo
{
    public MdbItemInfo ItemInfo { get; set; }
    public CardInfo CardInfo { get; set; }
}

public class MdbShopInfo 
{
    public int shop_id { get; set; }
    public int gacha_key { get; set; }
    public string asset_name { get; set; }
    public long asset_amount { get; set; }
}
