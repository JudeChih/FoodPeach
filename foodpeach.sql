-- 搜尋店名，找出該店的所有商品
DELIMITER $$
CREATE PROCEDURE show_item(store_name varchar(50))
BEGIN
SELECT s.sl_name as '店名',
s.sl_address as '地址',
s.sl_phone as '電話',
p.pl_name as '菜名',
p.pl_img as '圖片',
p.pl_price as '單價',
p.pl_content as '簡介'
FROM store_list as s
LEFT JOIN menu_list as m on m.sl_id = s.sl_id
LEFT JOIN product_list as p on p.pl_id = m.pl_id
WHERE s.sl_name =store_name;
END$$
DELIMITER ;


-- 找出該筆的資訊
   DROP FUNCTION show_info;
    DELIMITER $$
    CREATE FUNCTION show_info(store_name varchar(50),pl_name varchar(50)) RETURNS varchar(50)
    BEGIN
    set @num =(
    SELECT p.pl_id as 'V'
    FROM store_list as s 
    LEFT JOIN menu_list as m on m.sl_id = s.sl_id 
    LEFT JOIN product_list as p on p.pl_id = m.pl_id
    WHERE s.sl_name =store_name and p.pl_name =pl_name);
    SELECT @num;
    RETURN  @num;


    END$$
    DELIMITER ;

-- 新增資料
INSERT INTO table (name)
OUTPUT Inserted.ID
VALUES('bob');


DROP PROCEDURE addOrder;
DELIMITER $$

create PROCEDURE addOrder(n varchar(200))
BEGIN
  set @stmt = concat("INSERT INTO order_detail (od_id, ol_id, pl_id, od_num, od_remark) VALUES (NULL,", n ,")");
  PREPARE ss from @stmt;
  EXECUTE ss;
    SELECT (n);

end $$
DELIMITER ;


--

DROP PROCEDURE insert_list;
DELIMITER $$
CREATE PROCEDURE insert_list(store_name varchar(50))
BEGIN
   SELECT 
    p.pl_name as '菜名'
FROM store_list as s 
LEFT JOIN menu_list as m on m.sl_id = s.sl_id 
LEFT JOIN product_list as p on p.pl_id = m.pl_id
WHERE s.sl_name =store_name;
END$$
DELIMITER ;


--字串分割
    DELIMITER $$
    CREATE PROCEDURE str(v_str varchar(200))
    BEGIN
    DECLARE V_START  INTEGER;
    DECLARE V_LOCATE INTEGER;
    SET V_START=1;
    BEGIN
        DECLARE V_STR_BEFORE VARCHAR(4000);
        WHILE INSTR(v_str,',')>0 DO
        SET V_LOCATE =INSTR(v_str,',');
        SET V_STR_BEFORE=SUBSTRING(v_str,V_START,V_LOCATE-V_START);
        select V_STR_BEFORE;
        commit;
        SET V_STR =SUBSTRING(v_str,V_LOCATE+1);
        END WHILE;
        select V_STR;

    END; 
    END $$
    DELIMITER ;