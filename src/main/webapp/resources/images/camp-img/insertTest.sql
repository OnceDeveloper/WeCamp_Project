insert into AUTHORITY values(1, '�Ϲ�ȸ��');
insert into AUTHORITY values(2, '�����');
--silver, gold, diamond
insert into MEMBER values('linkdog@gmail.com', 1, '�̸�1', '�г���1', 'qwer1234@', '1995/02/13', 0, 'silver');
insert into OWNER values('linkdog@gmail.com', null, '�̸�1', '123-45-67890', 'ȸ���1', 'ȸ���ּ�1', '02-1234-1234');
insert into CAMP values(CAMP_SEQ.nextval, 'linkdog�ְ�ķ����', 37.6605421, 127.489966, '��⵵ ���� ���Ǹ� ��õ�߾ӷ�28���� 101-60', '��⵵ ���� ���Ǹ� ��õ�� 263-1', '000-0000-0000', 15, 60, 15, '����ü�,���ϼ����ü�,������,ȭ���', '��ȭ��,���Ǽ�', 'ȭ���,������,������', '031-580-2066','����û ������');
insert into SORT values(SORT_SEQ.nextval, 1, '�۷���', '������-1', 4, 180000, '������1.jpg');
insert into SORT values(SORT_SEQ.nextval, 1, '�۷���', '������-2', 4, 180000, '������2.jpg');
insert into SORT values(SORT_SEQ.nextval, 1, 'ī���', '�÷���-1', 6, 220000, '�÷���1.jpg');
insert into IMG values(IMG_SEQ.nextval, 1, 'linkdog-thumb_1234224.jpg', 'linkdog-thumb.jpg', 169911, 'thumb');
insert into IMG values(IMG_SEQ.nextval, 1, 'linkdog1_12431234.jpg', 'linkdog1.jpg', 169911, 'detail');
insert into IMG values(IMG_SEQ.nextval, 1, 'linkdog2_1124224s.jpg', 'linkdog2.jpg', 169911, 'detail');
insert into IMG values(IMG_SEQ.nextval, 1, 'linkdog3_15744324.jpg', 'linkdog3.jpg', 169911, 'detail');
update OWNER set CAMP_IDX = 1 where EMAIL = 'linkdog@gmail.com';
