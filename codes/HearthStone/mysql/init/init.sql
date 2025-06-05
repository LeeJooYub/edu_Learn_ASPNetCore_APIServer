-- ù ��° �����ͺ��̽��� MYSQL_DATABASE ȯ�溯���� �̹� ������ (hive_db)
-- �߰� �����ͺ��̽� ����
CREATE DATABASE IF NOT EXISTS master_db;
CREATE DATABASE IF NOT EXISTS game_db;

-- �� �����ͺ��̽��� ���� ���� ����
GRANT ALL PRIVILEGES ON hive_db.* TO 'root'@'%';
GRANT ALL PRIVILEGES ON master_db.* TO 'root'@'%';
GRANT ALL PRIVILEGES ON game_db.* TO 'root'@'%';
FLUSH PRIVILEGES;

use hive_db;

-- ����� ȸ������ �� �α����� �����ϴ� ���̺�

CREATE TABLE `account` (
    `account_uid` BIGINT NOT NULL AUTO_INCREMENT COMMENT '����ũ ���� ��ȣ',
    `email_id` VARCHAR(50) NOT NULL COMMENT '�������̵�. ������ �̸���',
    `nickname` VARCHAR(50) NOT NULL COMMENT '���� �г���',
    `pw` VARCHAR(100) NOT NULL COMMENT '�ؽ̵� ��й�ȣ',
    `salt_value` VARCHAR(100) NOT NULL COMMENT '��ȣȭ ��',
    `create_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���� �Ͻ�',
    PRIMARY KEY (`account_uid`),
    UNIQUE KEY `idx_email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

use game_db;

-- ����� �⺻ ������ �����ϴ� ���̺�
CREATE TABLE `user` (
    `account_uid` BIGINT NOT NULL,
    `main_deck_id` Int NOT NULL COMMENT '���� �� ����',
    `last_login_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '������ �α׾ƿ� �ð�',    
    PRIMARY KEY (`account_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ����� �⺻ ������ �����ϴ� ���̺�
CREATE TABLE `user_deck` (
    `account_uid` BIGINT NOT NULL,
    `deck_id` Int NOT NULL,
    `deck_list` VARCHAR(1024) NOT NULL,
    `create_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`account_uid`, `deck_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ����� ��ȭ ������ �����ϴ� ���̺�
CREATE TABLE `user_asset` (
    `account_uid` BIGINT NOT NULL,
    `asset_name` VARCHAR(100) NOT NULL,
    `asset_amount` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`account_uid`, `asset_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ����� �⼮ ������ �����ϴ� ���̺�
CREATE TABLE `user_attendance` (
    `account_uid` BIGINT NOT NULL,
    `event_id` INT NOT NULL DEFAULT 0,
    `attendance_no` INT NOT NULL DEFAULT 0,
    `attendance_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�ֱ� ������Ʈ �ð�',    
    PRIMARY KEY (`account_uid`, `event_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_item` (
    `account_uid` BIGINT NOT NULL,
    `item_id` INT NOT NULL,
    `item_cnt` INT NOT NULL,
    PRIMARY KEY (`account_uid`, `item_id`),
    INDEX `idx_user_user_id` (`account_uid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='����� ī�� ������ ����';

CREATE TABLE `user_mail` (
    `account_uid` BIGINT NOT NULL,
    `mail_id` BIGINT NOT NULL,
    `status` INT NOT NULL DEFAULT 0,
    `reward_key` INT NOT NULL,
    `mail_desc` VARCHAR(1024) NOT NULL,
    `received_dt` DATETIME NOT NULL,
    `expire_dt` DATETIME NOT NULL,
    PRIMARY KEY (`account_uid`, `mail_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='����� �̸��� ����';


use master_db;

-- ������ ���� ������ ������ ���̺�
CREATE TABLE IF NOT EXISTS `version` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `app_version` VARCHAR(20) NOT NULL,
    `master_data_version` VARCHAR(20) NOT NULL,
    `create_dt` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ������ ������ ������ ������ ���̺�
CREATE TABLE IF NOT EXISTS `item` (
    `item_id` BIGINT NOT NULL,
    `item_grade_code` CHAR(2) NOT NULL, -- ����, ����, ���, �Ϲ�, ����
    `item_type` TINYINT NOT NULL, 
    `ability_key` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- �����Ƽ ������ ������ ������ ���̺�
CREATE TABLE IF NOT EXISTS `ability` (
    `ability_key` INT NOT NULL,
    `ability_type` VARCHAR(8) NOT NULL,
    `ability_value` BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ������ ���� �̱� ������ ������ ���̺�
CREATE TABLE IF NOT EXISTS `gacha_info` (
    `gacha_key` INT NOT NULL,    
    `count` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ������ ���� �̱� Ȯ���� ������ ���̺�
CREATE TABLE IF NOT EXISTS `gacha_rate` (
    `gacha_key` INT NOT NULL,    
    `item_id` INT NOT NULL,
    `rate` BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- �⼮ ������ ������ ���̺� - ����, ����
CREATE TABLE IF NOT EXISTS `attendance_info` (
    `event_id` INT NOT NULL,
    `free_yn` bit NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- �⼮ ���� ������ ������ ���̺�
CREATE TABLE IF NOT EXISTS `attendance_reward` (
    `day_seq` INT NOT NULL,
    `event_id` INT NOT NULL,
    `reward_key` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ���� ������ ������ ���̺�
CREATE TABLE IF NOT EXISTS `reward_info` (
    `reward_key` INT NOT NULL,
    `reward_class` VARCHAR(20) NOT NULL,
    `reward_type` VARCHAR(20) NOT NULL,
    `reward_value` BIGINT NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ȸ������ �� ����� �����Ǵ� �ʱ� ī�� ���� ���̺�
CREATE TABLE IF NOT EXISTS `initial_free_items` (
    `item_id` INT  NOT NULL,
    `item_cnt` INT NOT NULL DEFAULT 1
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ȸ������ �� �⺻���� �����Ǵ� ��ȭ ���� ���̺�
CREATE TABLE IF NOT EXISTS `initial_asset` (
     `asset_name` VARCHAR(100) NOT NULL,
     `asset_amount` BIGINT NOT NULL DEFAULT 0
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `initial_mail` (
    `mail_id` BIGINT NOT NULL,
    `status` INT NOT NULL DEFAULT 0,
    `reward_key` INT NOT NULL,
    `mail_desc` VARCHAR(1024) NOT NULL,
    `received_dt` DATETIME NOT NULL,
    `expire_dt` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='�ű� ȸ�� �ʱ� ����';


CREATE TABLE IF NOT EXISTS `shop` (
    `shop_id` INT NOT NULL,    
    `gacha_key` INT NOT NULL,    
    `asset_name` VARCHAR(100) NOT NULL,    
    `asset_amount` BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


USE master_db;

-- 1. VERSION ���̺� (20��)
INSERT INTO `version` (`app_version`, `master_data_version`) VALUES 
('1.0.0', '2025-01-01'),
('1.0.1', '2025-01-15'),
('1.0.2', '2025-02-01'),
('1.1.0', '2025-02-15'),
('1.1.1', '2025-03-01'),
('1.1.2', '2025-03-15'),
('1.2.0', '2025-04-01'),
('1.2.1', '2025-04-15'),
('1.2.2', '2025-05-01'),
('1.3.0', '2025-05-15'),
('1.3.1', '2025-06-01'),
('1.3.2', '2025-06-15'),
('1.4.0', '2025-07-01'),
('1.4.1', '2025-07-15'),
('1.4.2', '2025-08-01'),
('1.5.0', '2025-08-15'),
('1.5.1', '2025-09-01'),
('1.5.2', '2025-09-15'),
('1.6.0', '2025-10-01'),
('1.6.1', '2025-10-15');

INSERT INTO `ability` (`ability_key`, `ability_type`, `ability_value`) VALUES
-- 1�� �ϼ��� ī�� (1 ����)
(1001, 'attack', 1), (1001, 'hp', 1), (1001, 'mana', 1),
(1002, 'attack', 1), (1002, 'hp', 2), (1002, 'mana', 1),
(1003, 'attack', 1), (1003, 'hp', 3), (1003, 'mana', 1),
(1004, 'attack', 2), (1004, 'hp', 1), (1004, 'mana', 1),
(1005, 'attack', 2), (1005, 'hp', 2), (1005, 'mana', 1),

-- 2�� �ϼ��� ī�� (2 ����)
(1006, 'attack', 2), (1006, 'hp', 3), (1006, 'mana', 2),
(1007, 'attack', 3), (1007, 'hp', 2), (1007, 'mana', 2),
(1008, 'attack', 1), (1008, 'hp', 4), (1008, 'mana', 2),
(1009, 'attack', 3), (1009, 'hp', 1), (1009, 'mana', 2),

-- 3�� �ϼ��� ī�� (3 ����)
(1010, 'attack', 3), (1010, 'hp', 3), (1010, 'mana', 3),
(1011, 'attack', 2), (1011, 'hp', 4), (1011, 'mana', 3),
(1012, 'attack', 4), (1012, 'hp', 2), (1012, 'mana', 3),
(1013, 'attack', 1), (1013, 'hp', 6), (1013, 'mana', 3),
(1014, 'attack', 3), (1014, 'hp', 4), (1014, 'mana', 3),

-- �߰� ���� (�پ��� �뷱��)
(1015, 'attack', 1), (1015, 'hp', 1), (1015, 'mana', 2), -- ���� 2�ڽ�Ʈ
(1016, 'attack', 2), (1016, 'hp', 1), (1016, 'mana', 3), -- ���� 3�ڽ�Ʈ
(1017, 'attack', 1), (1017, 'hp', 2), (1017, 'mana', 3), -- ���� 3�ڽ�Ʈ
(1018, 'attack', 3), (1018, 'hp', 3), (1018, 'mana', 2), -- ���� 2�ڽ�Ʈ
(1019, 'attack', 2), (1019, 'hp', 3), (1019, 'mana', 1), -- ���� 1�ڽ�Ʈ

-- Ư�� �ϼ��� (���� ����)
(1020, 'attack', 2), (1020, 'hp', 2), (1020, 'mana', 2), -- 2/2/2
(1021, 'attack', 3), (1021, 'hp', 3), (1021, 'mana', 3), -- 3/3/3
(1022, 'attack', 1), (1022, 'hp', 1), (1022, 'mana', 1), -- 1/1/1

-- ����� ����
(1023, 'attack', 3), (1023, 'hp', 2), (1023, 'mana', 1), -- ������ 1�ڽ�Ʈ
(1024, 'attack', 1), (1024, 'hp', 3), (1024, 'mana', 2), -- ����� 2�ڽ�Ʈ
(1025, 'attack', 3), (1025, 'hp', 1), (1025, 'mana', 3), -- ������ 3�ڽ�Ʈ
(1026, 'attack', 2), (1026, 'hp', 5), (1026, 'mana', 3), -- ����� 3�ڽ�Ʈ
(1027, 'attack', 4), (1027, 'hp', 4), (1027, 'mana', 3); -- ���� 3�ڽ�Ʈ


-- 2. ITEM ���̺� (20��)
-- item_grade_code: LE(����), EP(����), RA(���), CO(�Ϲ�), FR(����)
-- item_type: 0(����), 1(�̴Ͼ�), 2(�ֹ�), 3(����), 4(��Ƽ��Ʈ), 5(��)
-- 2. item ���̺� �̴Ͼ� 20�� �߰� (ability_key�� ��Ī)
INSERT INTO `item` (`item_id`, `item_grade_code`, `item_type`, `ability_key`) VALUES
-- 1�ڽ�Ʈ(����) �ϼ��� ī��
(1001, 'CO', 1, 1001), -- 1/1/1 �Ϲ� �ϼ���
(1002, 'CO', 1, 1002), -- 1/2/1 �Ϲ� �ϼ���
(1003, 'CO', 1, 1003), -- 1/3/1 �Ϲ� �ϼ���
(1004, 'RA', 1, 1004), -- 2/1/1 ��� �ϼ��� (������)
(1005, 'RA', 1, 1005), -- 2/2/1 ��� �ϼ��� (�뷱��)
(1019, 'RA', 1, 1019), -- 2/3/1 ��� �ϼ��� (�����)
(1023, 'EP', 1, 1023), -- 3/2/1 ���� �ϼ��� (���� 1�ڽ�Ʈ)

-- 2�ڽ�Ʈ(����) �ϼ��� ī��
(1006, 'CO', 1, 1006), -- 2/3/2 �Ϲ� �ϼ���
(1007, 'CO', 1, 1007), -- 3/2/2 �Ϲ� �ϼ���
(1008, 'RA', 1, 1008), -- 1/4/2 ��� �ϼ��� (�����)
(1009, 'RA', 1, 1009), -- 3/1/2 ��� �ϼ��� (������)
(1015, 'FR', 1, 1015), -- 1/1/2 ���� �ϼ��� (����)
(1018, 'EP', 1, 1018), -- 3/3/2 ���� �ϼ��� (����)
(1020, 'RA', 1, 1020), -- 2/2/2 ��� �ϼ��� (�뷱��)
(1024, 'CO', 1, 1024), -- 1/3/2 �Ϲ� �ϼ��� (�����)

-- 3�ڽ�Ʈ(����) �ϼ��� ī��
(1010, 'CO', 1, 1010), -- 3/3/3 �Ϲ� �ϼ���
(1011, 'CO', 1, 1011), -- 2/4/3 �Ϲ� �ϼ���
(1012, 'RA', 1, 1012), -- 4/2/3 ��� �ϼ��� (������)
(1013, 'RA', 1, 1013), -- 1/6/3 ��� �ϼ��� (�����)
(1014, 'EP', 1, 1014), -- 3/4/3 ���� �ϼ��� (����)
(1016, 'FR', 1, 1016), -- 2/1/3 ���� �ϼ��� (����)
(1017, 'FR', 1, 1017), -- 1/2/3 ���� �ϼ��� (����)
(1021, 'EP', 1, 1021), -- 3/3/3 ���� �ϼ��� (�뷱��)
(1025, 'RA', 1, 1025), -- 3/1/3 ��� �ϼ��� (������)
(1026, 'EP', 1, 1026), -- 2/5/3 ���� �ϼ��� (�����)
(1027, 'LE', 1, 1027); -- 4/4/3 ���� �ϼ��� (�ſ� ����)

-- 4. GACHA_INFO ���̺� (20��)
-- gacha_key: ��í ���� Ű, count: �� ��í�� ���� ���� ������ ����
INSERT INTO `gacha_info` (`gacha_key`, `count`) VALUES 
(121, 1);  -- �ϼ��� ī���� (5��)


-- gacha_key: ��í ���� Ű, count: �� ��í�� ���� ���� ������ ����
INSERT INTO `shop` (`shop_id`, `gacha_key`,`asset_name`, `asset_amount`) VALUES 
(1, 121, 'gold', 5);  -- �ϼ��� ī���� (5��)

-- 5. GACHA_RATE ���̺� (20��)
-- �̴Ͼ� 20�� ���� ��í ����Ʈ (gacha_key 120)
INSERT INTO `gacha_rate` (`gacha_key`, `item_id`, `rate`) VALUES
-- 1�ڽ�Ʈ �ϼ��� ī�� (7��)
(121, 1001, 750),  -- CO - �Ϲ� �ϼ��� 1/1/1
(121, 1002, 750),  -- CO - �Ϲ� �ϼ��� 1/2/1
(121, 1003, 750),  -- CO - �Ϲ� �ϼ��� 1/3/1
(121, 1004, 375),  -- RA - ��� �ϼ��� 2/1/1
(121, 1005, 375),  -- RA - ��� �ϼ��� 2/2/1
(121, 1019, 375),  -- RA - ��� �ϼ��� 2/3/1
(121, 1023, 75),   -- EP - ���� �ϼ��� 3/2/1

-- 2�ڽ�Ʈ �ϼ��� ī�� (8��)
(121, 1006, 625),  -- CO - �Ϲ� �ϼ��� 2/3/2
(121, 1007, 625),  -- CO - �Ϲ� �ϼ��� 3/2/2
(121, 1008, 312),  -- RA - ��� �ϼ��� 1/4/2
(121, 1009, 312),  -- RA - ��� �ϼ��� 3/1/2
(121, 1015, 475),  -- FR - ���� �ϼ��� 1/1/2
(121, 1018, 62),   -- EP - ���� �ϼ��� 3/3/2
(121, 1020, 313),  -- RA - ��� �ϼ��� 2/2/2
(121, 1024, 625),  -- CO - �Ϲ� �ϼ��� 1/3/2

-- 3�ڽ�Ʈ �ϼ��� ī�� (11��)
(121, 1010, 455),  -- CO - �Ϲ� �ϼ��� 3/3/3
(121, 1011, 455),  -- CO - �Ϲ� �ϼ��� 2/4/3
(121, 1012, 227),  -- RA - ��� �ϼ��� 4/2/3
(121, 1013, 228),  -- RA - ��� �ϼ��� 1/6/3
(121, 1014, 45),   -- EP - ���� �ϼ��� 3/4/3
(121, 1016, 475),  -- FR - ���� �ϼ��� 2/1/3
(121, 1017, 475),  -- FR - ���� �ϼ��� 1/2/3
(121, 1021, 45),   -- EP - ���� �ϼ��� 3/3/3
(121, 1025, 228),  -- RA - ��� �ϼ��� 3/1/3
(121, 1026, 45),   -- EP - ���� �ϼ��� 2/5/3
(121, 1027, 10);   -- LE - ���� �ϼ��� 4/4/3

-- 6. ATTENDANCE_INFO ���̺� (20��)
INSERT INTO `attendance_info` (`event_id`, `free_yn`) VALUES 
(1, 1),  -- �Ϲ� �⼮ �̺�Ʈ (����)
(2, 1),  -- �ű� ���� �⼮ �̺�Ʈ (����)
(101, 0), -- �����̾� �н� �⼮ (����)
(102, 0), -- ���� �н� �⼮ (����)
(103, 0), -- ��Ʋ �н� �⼮ (����)
(104, 0), -- VIP �⼮ ���� (����)
(105, 0), -- ��� �н� �⼮ (����)
(106, 0), -- ���� ����� �н� (����)
(107, 0), -- �ܿ� ����� �н� (����)
(108, 0), -- 1�ֳ� ����� �н� (����)
(109, 0), -- 2�ֳ� ����� �н� (����)
(110, 0); -- ����Ƽ�� �̺�Ʈ �н� (����)

-- 7. ATTENDANCE_REWARD ���̺� (20��)
INSERT INTO `attendance_reward` (`day_seq`, `event_id`, `reward_key`) VALUES 
-- �Ϲ� �⼮ �̺�Ʈ ���� (event_id 1)
(1, 1, 101), -- 1����: ��� 100
(2, 1, 102), -- 2����: ��� 200
(3, 1, 103), -- 3����: ��� 300
(4, 1, 104), -- 4����: ��� 400
(5, 1, 105), -- 5����: ��� 500
(6, 1, 106), -- 6����: ��� 600
(7, 1, 201), -- 7����: ���̾� 100

-- �ű� ���� �⼮ �̺�Ʈ ���� (event_id 2)
(1, 2, 101), -- 1����: ��� 100
(2, 2, 102), -- 2����: ��� 200
(3, 2, 201), -- 3����: ���̾� 100
(4, 2, 302), -- 4����: ī���� 1��
(5, 2, 103), -- 5����: ��� 300
(6, 2, 401), -- 6����: ��� ī�� 1��
(7, 2, 501), -- 7����: ���� ī�� 1��

-- �����̾� �н� �⼮ ���� (event_id 101)
(1, 101, 103), -- 1����: ��� 300
(2, 101, 201), -- 2����: ���̾� 100
(3, 101, 204), -- 3����: ���̾� 400
(4, 101, 302), -- 4����: ī���� 1��
(5, 101, 303), -- 5����: ī���� 2��
(6, 101, 502); -- 6����: ���� ī�� 2��

-- ATTENDANCE_REWARD ���̺� �߰� ������ (�� 40���� �ǵ���)
INSERT INTO `attendance_reward` (`day_seq`, `event_id`, `reward_key`) VALUES 
-- ���� �⼮ �̺�Ʈ ���� (event_id 5)
(1, 5, 101),  -- 1����: ��� 100
(5, 5, 102),  -- 5����: ��� 200
(10, 5, 103), -- 10����: ��� 300
(15, 5, 201), -- 15����: ���̾� 100
(20, 5, 302), -- 20����: ī���� 1��
(25, 5, 303), -- 25����: ī���� 2��
(30, 5, 501), -- 30����: ���� ī�� 1��

-- ���� �н� �⼮ ���� (event_id 102)
(1, 102, 103),  -- 1����: ��� 300
(3, 102, 201),  -- 3����: ���̾� 100
(5, 102, 302),  -- 5����: ī���� 1��
(7, 102, 402),  -- 7����: ��� ī�� 2��
(10, 102, 204), -- 10����: ���̾� 400
(15, 102, 303), -- 15����: ī���� 2��
(20, 102, 501), -- 20����: ���� ī�� 1��

-- 1�ֳ� �⼮ �̺�Ʈ ���� (event_id 9)
(1, 9, 105),  -- 1����: ��� 500
(2, 9, 202),  -- 2����: ���̾� 200
(3, 9, 302),  -- 3����: ī���� 1��
(4, 9, 402),  -- 4����: ��� ī�� 2��
(5, 9, 105),  -- 5����: ��� 500
(6, 9, 203),  -- 6����: ���̾� 300
(7, 9, 501);  -- 7����: ���� ī�� 1��

-- 8. REWARD_INFO ���̺� (20��)
INSERT INTO `reward_info` (`reward_key`, `reward_class`, `reward_type`, `reward_value`) VALUES 
-- ��� ����
(101, 'currency', 'gold', 100),
(102, 'currency', 'gold', 200),
(103, 'currency', 'gold', 300),
(104, 'currency', 'gold', 400),
(105, 'currency', 'gold', 500),
(106, 'currency', 'gold', 600),
(107, 'currency', 'gold', 700),
(108, 'currency', 'gold', 800),
(109, 'currency', 'gold', 900),
(110, 'currency', 'gold', 1000),

-- ���̾� ����
(201, 'currency', 'diamond', 100),
(202, 'currency', 'diamond', 200),
(203, 'currency', 'diamond', 300),
(204, 'currency', 'diamond', 400),
(205, 'currency', 'diamond', 500),

-- ������ ���� (ī����, ī�� ��)
(301, 'item', '9001', 1), -- �Ϲ� ī���� 1��
(302, 'item', '9002', 1), -- ��� ī���� 1��
(303, 'item', '9002', 2), -- ��� ī���� 2��
(401, 'item', '2001', 1), -- ��� �̴Ͼ� ī�� 1��
(402, 'item', '2001', 2); -- ��� �̴Ͼ� ī�� 2��

-- REWARD_INFO ���̺� �߰� ������ (�� 40���� �ǵ���)
INSERT INTO `reward_info` (`reward_key`, `reward_class`, `reward_type`, `reward_value`) VALUES 
-- ��� ���� �߰�
(111, 'currency', 'gold', 1500),
(112, 'currency', 'gold', 2000),
(113, 'currency', 'gold', 2500),
(114, 'currency', 'gold', 3000),
(115, 'currency', 'gold', 5000),

-- ���̾� ���� �߰�
(206, 'currency', 'diamond', 600),
(207, 'currency', 'diamond', 800),
(208, 'currency', 'diamond', 1000),
(209, 'currency', 'diamond', 1500),
(210, 'currency', 'diamond', 2000),

-- ������ ���� �߰� (����, ���� ī�� ��)
(403, 'item', '2002', 1), -- ��� �̴Ͼ� ī�� 1�� (�ٸ� ����)
(404, 'item', '2002', 2), -- ��� �̴Ͼ� ī�� 2�� (�ٸ� ����)
(405, 'item', '1003', 1), -- ������ ���� ī�� 1��
(406, 'item', '1004', 1), -- ������ ���� ī�� 1�� (�ٸ� ����)
(501, 'item', '1001', 1), -- ���� ���� ī�� 1��
(502, 'item', '1001', 2), -- ���� ���� ī�� 2��
(503, 'item', '1002', 1), -- ���� ���� ī�� 1�� (�ٸ� ����)
(504, 'item', '3001', 1), -- ���� �ֹ� ī�� 1��
(505, 'item', '4001', 1), -- ���� ���� ī�� 1��
(506, 'item', '5001', 1); -- ���� ��Ƽ��Ʈ ī�� 1��

-- 9. INITIAL_FREE_ITEMS ���̺� (5��)
INSERT INTO `initial_free_items` (`item_id`, `item_cnt`) VALUES 
(1001, 1), -- ������ ���� ī�� 1��
(1002, 1), -- �Ϲ� ī���� 1��
(1003, 1), -- �Ϲ� ī���� 1��
(1004, 1), -- �Ϲ� ī���� 1��
(1005, 1), -- �Ϲ� ī���� 1��
(1006, 1), -- �Ϲ� ī���� 1��
(1007, 1), -- �Ϲ� ī���� 1��
(1008, 1), -- �Ϲ� ī���� 1��
(1009, 1), -- �Ϲ� ī���� 1��
(1015, 1); -- �Ϲ� ī���� 1��

-- 10. INITIAL_MAIL ���̺� (5��)
-- 10. INITIAL_MAIL ���̺� (5��)
INSERT INTO `initial_mail` (`mail_id`, `status`, `reward_key`, `mail_desc`, `received_dt`, `expire_dt`) VALUES 
(1000001, 0, 105, 'Welcome! Here 500 gold as our gift to you.', '2025-05-14 10:00:00', '2026-05-14 10:00:00'),
(1000002, 0, 201, 'Welcome! Enjoy 100 diamonds as our gift.', '2025-05-14 10:00:00', '2026-05-14 10:00:00'),
(1000003, 0, 301, 'Welcome! We sent you a card pack as a gift.', '2025-05-14 10:00:00', '2026-05-14 10:00:00'),
(1000004, 0, 405, 'Welcome! Here an epic hero card for you.', '2025-05-14 10:00:00', '2026-05-14 10:00:00'),
(1000005, 0, 302, 'Pre-registration special reward! Here a rare card pack for you.', '2025-05-14 10:00:00', '2026-05-14 10:00:00');
