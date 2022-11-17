use quanlybanhang;
-- hien thi thong tin oID, oDate, oPrice cua tat ca cac hoa don trong bang order

-- hien thi danh sach cac khach hang da mua hang va danh sach san pham duoc mua boi khach
select  o.cId, c.cName, od.pId
from `order` o
join `orderdetail` od on o.oID = od.oID
join `product` p on od.pID = p.pID
join `customer` c on c.cId = o.cId;
-- hien thi ten nhung khach hang khong mua bat ky san pham nao
select cId, cName from `customer`
where cId not in (select cId from `order`);
-- hien thi ma hoa don, ngay ban, va gia tien tung hoa don (gia mot hoa don duoc tinh bang tong gia ban tung loai mat hang xuat hien trong hoa don. Gia ban cua tung loai duoc tinh = odQTY * pPrice
select od.oId, o.oDate, sum(od.odQTY * p.pPrice) tongtien
from `order` o
join `orderdetail` od on o.oId = od.oId
join `product` p on p.pId = od.pId
group by od.oId;
