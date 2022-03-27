CREATE VIEW vw_CTPNHAP AS SELECT phieunhap_ID,material_ID,SoLuongNhap,DonGiaNhap,SUM(SoLuongNhap*chitieuphieunhap.DonGiaNhap) AS 'Thanh Tien Nhap' FROM chitieuphieunhap
    JOIN material m on m.iD = chitieuphieunhap.material_ID
    JOIN phieunhap p on p.iD = chitieuphieunhap.phieunhap_ID
GROUP BY phieunhap_ID, material_ID, SoLuongNhap, DonGiaNhap;
select * from vw_CTPNHAP;

CREATE VIEW vw_CTPNHAP_VT AS SELECT phieunhapID, materialID, materialName, SoLuongNhap, DonGiaNhap, SUM(SoLuongNhap*DonGiaNhap) FROM phieunhap
    JOIN chitieuphieunhap c on phieunhap.iD = c.phieunhap_ID
    JOIN material m on m.iD = c.material_ID
GROUP BY phieunhapID, materialID, materialName, SoLuongNhap, DonGiaNhap;
select * from vw_CTPNHAP_VT;

CREATE VIEW vw_CTPNHAP_VT_PN AS SELECT phieunhapID, PhieunhapDate, billorderID, materialID,SoLuongNhap,DonGiaNhap,SUM(SoLuongNhap*DonGiaNhap) FROM phieunhap
    JOIN chitieuphieunhap c on phieunhap.iD = c.phieunhap_ID
    JOIN material m on m.iD = c.material_ID
    JOIN billorder b on b.iD = phieunhap.billorder_ID
GROUP BY  phieunhapID, PhieunhapDate, billorderID, materialID, SoLuongNhap, DonGiaNhap;
select * from vw_CTPNHAP_VT_PN;

CREATE VIEW vw_CTPNHAP_VT_PN_DH AS SELECT phieunhapID,PhieunhapDate,billorderID,providerID,materialID,materialName,SoLuongNhap,DonGiaNhap,SUM(SoLuongNhap*DonGiaNhap) FROM phieunhap
    JOIN chitieuphieunhap c on phieunhap.iD = c.phieunhap_ID
    JOIN material m on m.iD = c.material_ID
    JOIN billorder b on b.iD = phieunhap.billorder_ID
    JOIN provider p on p.iD = b.provider_ID
GROUP BY phieunhapID, PhieunhapDate, billorderID, providerID, materialID, materialName, SoLuongNhap, DonGiaNhap;
select * from vw_CTPNHAP_VT_PN_DH;

CREATE  VIEW  vw_CTPNHAP_loc AS SELECT phieunhapID,materialID,SoLuongNhap,DonGiaNhap,SUM(SoLuongNhap*DonGiaNhap) FROM phieunhap
    JOIN chitieuphieunhap c on phieunhap.iD = c.phieunhap_ID
    JOIN material m on m.iD = c.material_ID
GROUP BY phieunhapID, materialID, SoLuongNhap, DonGiaNhap HAVING (SoLuongNhap)>5;
select * from vw_CTPNHAP_loc;

CREATE  VIEW vw_CTPNHAP_VT_loc AS SELECT phieunhapID,materialID,materialUnit,SoLuongNhap,DonGiaNhap,SUM(SoLuongNhap*DonGiaNhap)
    FROM phieunhap
    JOIN chitieuphieunhap c on phieunhap.iD = c.phieunhap_ID
    JOIN material m on m.iD = c.material_ID
GROUP BY phieunhapID, materialID,materialUnit, SoLuongNhap, DonGiaNhap HAVING (materialUnit = 'Kg') ;
select * from vw_ctpnhap_vt_loc;

CREATE VIEW vw_CTPXUAT AS SELECT phieuxuatID,materialID,Soluongxuat,dongiaxuat,SUM(Soluongxuat*dongiaxuat) FROM phieuxuat
    JOIN chitietphieuxuat c on phieuxuat.iD = c.phieuxuat_ID
    JOIN material m on m.iD = c.material_ID
GROUP BY phieuxuatID, materialID, Soluongxuat, dongiaxuat;
select * from vw_CTPXUAT;

CREATE VIEW vw_CTPXUAT_VT AS SELECT phieuxuatID,materialName,materialID,Soluongxuat,dongiaxuat FROM phieuxuat
    JOIN chitietphieuxuat c on phieuxuat.iD = c.phieuxuat_ID
    JOIN material m on m.iD = c.material_ID
GROUP BY phieuxuatID, materialName, materialID, Soluongxuat, dongiaxuat;
select * from  vw_CTPXUAT_VT;

CREATE VIEW  vw_CTPXUAT_VT_PX AS SELECT phieuxuatID,customerName,materialID,Soluongxuat,dongiaxuat FROM phieuxuat
     JOIN chitietphieuxuat c on phieuxuat.iD = c.phieuxuat_ID
     JOIN material m on m.iD = c.material_ID
GROUP BY phieuxuatID, customerName, materialID, Soluongxuat, dongiaxuat;
select * from vw_CTPXUAT_VT_PX;


