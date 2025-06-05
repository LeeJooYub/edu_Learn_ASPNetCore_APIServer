# ���� �����ͺ��̽� ��Ű��

## �����ͺ��̽� ���� ����

| �����ͺ��̽� | ���� | �ֿ� ��� |
|-----------|-----|---------|
| hive_db | ���� �����ͺ��̽� | ���� ����, �α��� ���� |
| game_db | ���� �����ͺ��̽� | ����� ���� ������ ���� |
| master_db | ������ �����ͺ��̽� | ���� ����, ������ ���� |

---

## hive_db

### account ���̺�
**����**: ����� ���� ���� ����

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| account_uid | BIGINT | PK, AUTO_INCREMENT | ����ũ ���� ��ȣ |
| email_id | VARCHAR(50) | NOT NULL, UNIQUE (idx_email_id) | �������̵�. ������ �̸��� |
| nickname | VARCHAR(50) | NOT NULL | ���� �г��� |
| pw | VARCHAR(100) | NOT NULL | �ؽõ� ��й�ȣ |
| salt_value | VARCHAR(100) | NOT NULL | ��ȣȭ �� |
| create_dt | DATETIME | NOT NULL, DEFAULT CURRENT_TIMESTAMP | ���� �Ͻ� |

---

## game_db

### user ���̺�
**����**: ����� �⺻ ������ �����ϴ� ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| account_uid | BIGINT | PK | ���� ���� ��ȣ |
| main_deck_id | INT | NOT NULL | ���� �� ���� |
| last_login_dt | DATETIME | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE | ������ �α׾ƿ� �ð� |

### user_deck ���̺�
**����**: ����� �⺻ ������ �����ϴ� ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| account_uid | BIGINT | PK | ���� ���� ��ȣ |
| deck_id | INT | PK | �� ID |
| deck_list | VARCHAR(1024) | NOT NULL | �� ī�� ����Ʈ |
| create_dt | DATETIME | NOT NULL, DEFAULT CURRENT_TIMESTAMP | ���� �Ͻ� |

### user_asset ���̺�
**����**: ����� ��ȭ ������ �����ϴ� ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| account_uid | BIGINT | PK | ���� ���� ��ȣ |
| asset_name | VARCHAR(100) | PK | ��ȭ �̸� |
| asset_amount | BIGINT | NOT NULL, DEFAULT 0 | ��ȭ ���� |

### user_attendance ���̺�
**����**: ����� �⼮ ������ �����ϴ� ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| account_uid | BIGINT | PK | ���� ���� ��ȣ |
| event_id | INT | PK, DEFAULT 0 | �⼮ Ű |
| attendance_no | INT | NOT NULL, DEFAULT 0 | �⼮ ��ȣ |
| attendance_dt | DATETIME | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE | �ֱ� ������Ʈ �ð� |

### user_item ���̺�
**����**: ����� ī�� ������ ����

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| account_uid | BIGINT | PK, INDEX (idx_user_user_id) | ���� ���� ��ȣ |
| item_id | INT | PK | ������ ID |
| item_cnt | INT | NOT NULL | ������ ���� |

### user_mail ���̺�
**����**: ����� �̸��� ����

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| account_uid | BIGINT | PK | ���� ���� ��ȣ |
| mail_id | BIGINT | PK | ���� ID |
| status | INT | NOT NULL, DEFAULT 0 | ���� ���� |
| mail_info | VARCHAR(1024) | NOT NULL | ���� ���� (JSON) |
| mail_desc | VARCHAR(1024) | NOT NULL | ���� ���� |
| received_dt | DATETIME | NOT NULL | ���� �Ͻ� |
| expire_dt | DATETIME | NOT NULL | ���� �Ͻ� |

---

## master_db

### version ���̺�
**����**: ������ ���� ������ ������ ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| id | INT | PK, AUTO_INCREMENT | ���� ID |
| app_version | VARCHAR(20) | NOT NULL | �� ���� |
| master_data_version | VARCHAR(20) | NOT NULL | ������ ������ ���� |
| create_dt | DATETIME | DEFAULT CURRENT_TIMESTAMP | ���� �Ͻ� |

### item ���̺�
**����**: ������ ������ ������ ������ ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| item_id | BIGINT | NOT NULL | ������ ID |
| quality | TINYINT | NOT NULL | ǰ�� (����, ����, ���, �Ϲ�, ����) |
| item_type | TINYINT | NOT NULL | ������ Ÿ�� |
| ability_key | INT | NOT NULL | �ɷ�ġ Ű |

### ability ���̺�
**����**: �����Ƽ ������ ������ ������ ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| ability_key | INT | NOT NULL | �ɷ�ġ Ű |
| ability_type | VARCHAR(8) | NOT NULL | �ɷ�ġ Ÿ�� |
| ability_value | BIGINT | NOT NULL | �ɷ�ġ �� |

### gacha_info ���̺�
**����**: ������ ���� �̱� Ȯ���� ������ ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| gacha_key | INT | NOT NULL | ��í Ű |
| count | INT | NOT NULL | �̱� Ƚ�� |

### gacha_rate ���̺�
**����**: ������ ���� �̱� ������ ������ ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| gacha_key | INT | NOT NULL | ��í Ű |
| item_id | BIGINT | NOT NULL | ������ ID |
| rate | BIGINT | NOT NULL | Ȯ�� |

### attendance_info ���̺�
**����**: �⼮ ������ ������ ���̺� - ����, ����

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| event_id | INT | NOT NULL | �⼮ Ű |
| free_yn | CHAR(1) | NOT NULL | ���� ���� (Y/N) |

### attendance_reward ���̺�
**����**: �⼮ ���� ������ ������ ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| day_seq | INT | NOT NULL | ���� |
| event_id | INT | NOT NULL | �⼮ Ű |
| reward_key | INT | NOT NULL | ���� Ű |

### reward_info ���̺�
**����**: ���� ������ ������ ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| reward_key | INT | NOT NULL | ���� Ű |
| reward_class | VARCHAR(20) | NOT NULL | ���� �з� |
| reward_type | VARCHAR(20) | NOT NULL | ���� Ÿ�� |
| reward_value | BIGINT | NOT NULL | ���� �� |

### initial_free_items ���̺�
**����**: ȸ������ �� ����� �����Ǵ� �ʱ� ī�� ���� ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| item_id | BIGINT | NOT NULL | ������ ID |
| item_cnt | INT | NOT NULL, DEFAULT 1 | ������ ���� |

### initial_asset ���̺�
**����**: ȸ������ �� �⺻���� �����Ǵ� ��ȭ ���� ���̺�

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| asset_name | VARCHAR(100) | NOT NULL | ��ȭ �̸� |
| asset_amount | BIGINT | NOT NULL, DEFAULT 0 | ��ȭ ���� |

### initial_mail ���̺�
**����**: �ű� ȸ�� �ʱ� ����

| �÷��� | ������ Ÿ�� | �������� | ���� |
|-------|-----------|---------|-----|
| mail_id | BIGINT | NOT NULL | ���� ID |
| status | INT | NOT NULL, DEFAULT 0 | ���� ���� |
| mail_info | VARCHAR(1024) | NOT NULL | ���� ���� (JSON) |
| mail_desc | VARCHAR(1024) | NOT NULL | ���� ���� |
| received_dt | DATETIME | NOT NULL | ���� �Ͻ� |
| expire_dt | DATETIME | NOT NULL | ���� �Ͻ� |
