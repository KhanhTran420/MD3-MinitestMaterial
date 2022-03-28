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
    SELECT SUM(v.Soluongxuat*v.dongiaxuat) FROM vw_ctpxuat v
        group by v.materialID having v.materialID = materialID;

end //
//DELIMITER ;

DELIMITER //
CREATE PROCEDURE getQuantityOrder(IN billorderID VARCHAR(50))
BEGIN
   SELECT b.billorderID,SUM(chitietdonhang.quantityDathang) FROM chitietdonhang
       JOIN billorder b on b.iD = chitietdonhang.billorder_ID
    GROUP BY b.billorderID HAVING b.billorderID= billorderID;
end //
//DELIMITER ;

CALL getQuantityOrder('DH03');

DELIMITER //
CREATE PROCEDURE addOrder(IN madon1 VARCHAR(50), IN ngay1 DATE, IN nhasx1_id INT)
BEGIN
    INSERT INTO billorder (billorderID,orderDate,provider_ID) VALUES (madon1,ngay1,nhasx1_id);
end //
//DELIMITER ;

CALL addOrder('DH04','2022-3-25',1);

SELECT * FROM billorder
