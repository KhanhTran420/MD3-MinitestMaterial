DELIMITER //
CREATE PROCEDURE getMaterialQuantity (IN materialID INT)
BEGIN
SELECT quantityBandau + tonkho.totalQuantityNhap - tonkho.totalQuantityXuat as 'tongsoluongcuoi'
FROM tonkho WHERE  material_ID = materialID;
END //
//DELIMITER ;
CALL getMaterialQuantity(1);

DELIMITER //
CREATE PROCEDURE getTotalXuat (IN materialID VARCHAR(50))
BEGIN
    SELECT `SUM(Soluongxuat*dongiaxuat)` FROM vw_ctpxuat c
    GROUP BY c.materialID HAVING c.materialID = materialID;
end //
//DELIMITER ;

CALL getTotalXuat('o1');

