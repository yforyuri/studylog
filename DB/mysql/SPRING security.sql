SELECT * FROM member;
commit;

-- 암호화 함수
select 
-- password(pw) as password, 
sha(pw) as sha,
    sha1(pw) as sha1, 
    sha2(pw, 256) as sha2, 
    md5(pw) as md5,
    HEX(AES_ENCRYPT(pw, 'password')) as AES_ENCRYPT1 ,
    AES_ENCRYPT(pw, SHA2('password', 256)) as AES_ENCRYPT2 from member limit 0,1;

-- 암호화
update member set pw = HEX(AES_ENCRYPT('11', 'password')) where idx = 29;

-- 복호화
select CONVERT(AES_DECRYPT(UNHEX(pw), 'password') using utf8) from member where idx=29;
select AES_DECRYPT(UNHEX(pw), 'password') from member where idx=29;

-- 암호화
update member set pw=HEX(AES_ENCRYPT('1111', SHA2('password', 256))) where idx = 29;
-- 복호화
select CONVERT(AES_DECRYPT(UNHEX(pw),  SHA2('password', 256)) using utf8) from member where idx=29;
select AES_DECRYPT(UNHEX(pw),  SHA2('password', 256)) from member where idx=29;
