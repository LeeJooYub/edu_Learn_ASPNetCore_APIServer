namespace HearthStoneWeb.Models.Hive;


public class HiveDBAccount
{
    public long account_uid { get; set; }         // ����ũ ���� ��ȣ (PK)
    public string email_id { get; set; }          // �������̵�(�̸���)
    public string nickname { get; set; }          // ���� �г���
    public string pw { get; set; }                // �ؽ̵� ��й�ȣ
    public string salt_value { get; set; }        // ��ȣȭ ��
    public DateTime create_dt { get; set; }       // ���� �Ͻ�
}
