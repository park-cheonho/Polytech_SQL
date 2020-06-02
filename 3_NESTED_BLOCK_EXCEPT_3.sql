
BEGIN 
    INSERT INTO DEPT VALUES(66, 'OUTER_BLK_PART', 'Main_Blk');
    
    <<Nested_BLOCK_1>>
    BEGIN
            INSERT INTO DEPT VALUES(76, 'LOCAL_PART_1', 'Nested_Blk1');        
            INSERT INTO DEPT VALUES(777, 'LOCAL_PART_1', 'Nested_Blk1'); -- ?ü∞???ûÑ ?óê?ü¨ Î∞úÏÉù
            INSERT INTO DEPT VALUES(77, 'LOCAL_PART_1', 'Nested_Blk1');
            INSERT INTO DEPT VALUES(78, 'LOCAL_PART_1', 'Nested_Blk1');
            COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END Nested_BLOCK_1;
    
    <<Nested_BLOCK_2>>
    BEGIN
            INSERT INTO DEPT VALUES(88, 'LOCAL_PART_2', 'Nested_Blk2');
            COMMIT;
    END Nested_BLOCK_2;
    
    INSERT INTO DEPT VALUES(99, 'OUTER_BLK_PART', 'Main_Blk');
END;
/
