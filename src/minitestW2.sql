CREATE DATABASE QuanLyVatTu2;
USE QuanLyVatTu2;
CREATE TABLE Material(
    iD INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    materialID VARCHAR(10) NOT NULL ,
    materialName VARCHAR(30) NOT NULL ,
    materialUnit VARCHAR(30) NOT NULL ,
    materialPrice INT
);
CREATE TABLE TonKho(
    iD INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    material_ID INT NOT NULL ,
    quantityBandau INT NOT NULL ,
    totalQuantityNhap INT NOT NULL ,
    totalQuantityXuat INT NOT NULL ,
    FOREIGN KEY (material_ID) REFERENCES Material(iD)
);

CREATE TABLE Provider(
    iD INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    providerID VARCHAR(10) NOT NULL ,
    providerName VARCHAR(30) NOT NULL ,
    Address VARCHAR(40) NOT NULL ,
    Phone VARCHAR(20) NOT NULL
);

CREATE TABLE Billorder(
    iD INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    billorderID VARCHAR(10) NOT NULL ,
    orderDate DATE ,
    provider_ID INT NOT NULL ,
    FOREIGN KEY (provider_ID) REFERENCES Provider(iD)
);

CREATE TABLE PhieuNhap(
    iD INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    phieunhapID VARCHAR(10) NOT NULL ,
    PhieunhapDate DATE,
    billorder_ID INT NOT NULL ,
    FOREIGN KEY (billorder_ID) REFERENCES Billorder(iD)
);

CREATE TABLE PhieuXuat(
    iD INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    phieuxuatID VARCHAR(10) NOT NULL ,
    phieuxuatDate DATE,
    customerName VARCHAR(20) NOT NULL
);

CREATE TABLE ChiTietDonHang(
    iD INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
    billorder_ID INT NOT NULL ,
    material_ID INT NOT NULL ,
    quantityDathang INT NOT NULL ,
    FOREIGN KEY (billorder_ID) REFERENCES Billorder(iD),
    FOREIGN KEY (material_ID) REFERENCES Material(iD)
);

CREATE TABLE ChiTieuPhieuNhap(
    iD INT NOT NULL  AUTO_INCREMENT PRIMARY KEY ,
    phieunhap_ID INT NOT NULL ,
    material_ID INT NOT NULL ,
    SoLuongNhap INT NOT NULL ,
    DonGiaNhap INT NOT NULL ,
    Ghichu VARCHAR(50),
    FOREIGN KEY (phieunhap_ID) REFERENCES PhieuNhap(iD),
    FOREIGN KEY (material_ID) REFERENCES Material(iD)
);

CREATE TABLE ChiTietPhieuXuat(
    iD INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    phieuxuat_ID INT NOT NULL ,
    material_ID INT NOT NULL ,
    Soluongxuat INT NOT NULL ,
    dongiaxuat INT NOT NULL ,
    Ghichu VARCHAR(50),
    FOREIGN KEY (phieuxuat_ID) REFERENCES  PhieuXuat(iD),
    FOREIGN KEY (material_ID) REFERENCES Material(iD)
);


INSERT INTO Material VALUES
(1,'T1','Thep','Thanh',10000),
(2,'G1','Gach','Vien',2000),
(3,'XM1','Ximang','Bao',8000),
(4,'C1','Cat','Kg',1000),
(5,'D1','Da','Kg',500);



INSERT INTO TonKho VALUES
(1,1,100,150,30),
(2,2,90,140,40),
(3,3,80,130,20),
(4,4,70,120,30),
(5,5,60,110,40);

INSERT INTO Provider VALUES
(1,'NCC1','Thanh Phat','Ha Noi','0989756375'),
(2,'NCC2','Thanh Dat','TP HCM','0986593659'),
(3,'NCC3','Thanh Cong','Da Nang','0955097746');

INSERT INTO Billorder VALUES
(1,'DH01','2022-3-22',1),
(2,'DH02','2022-3-23',2),
(3,'DH03','2022-3-24',3);

INSERT INTO PhieuNhap VALUES
(1,'PN01','2022-3-15',1),
(2,'PN02','2022-3-16',2),
(3,'PN03','2022-3-17',3);

INSERT INTO PhieuXuat VALUES
(1,'PX01','2022-3-27','Tran Quoc Khanh'),
(2,'PX01','2022-3-28','Nguyen Khanh Huong'),
(3,'PX01','2022-3-29','Le Thi Thu');

INSERT INTO ChiTietDonHang VALUES
(1,1,1,60),
(2,2,2,50),
(3,3,3,60),
(4,1,4,20),
(5,2,5,30),
(6,3,3,40);

INSERT INTO ChiTieuPhieuNhap VALUES
(1,1,5,50,400,'Nhap Da'),
(2,2,4,50,800,'Nhap Cat'),
(3,3,3,50,6000,'Nhap XiMang'),
(4,1,2,50,1000,'Nhap Gach'),
(5,2,1,50,8000,'Nhap Thep'),
(6,3,2,50,100,'Nhap Gach');

INSERT INTO ChiTietPhieuXuat VALUES
(1,1,3,50,7000,'Xuat XiMang'),
(2,2,4,50,900,'Xuat Cat'),
(3,3,5,50,450,'Xuat Da'),
(4,1,2,50,1500,'Xuat Gach'),
(5,2,3,50,7000,'Xuat XiMang'),
(6,3,1,50,9000,'Xuat Thep');