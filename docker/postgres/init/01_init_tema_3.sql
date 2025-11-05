-- 01_init.sql
CREATE TABLE facturas_xml (
    id SERIAL PRIMARY KEY,
    cliente TEXT,
    datos XML
);

INSERT INTO facturas_xml (cliente, datos)
VALUES
('Juan Pérez', xmlparse(document
'<factura id="F001">
   <fecha>2025-10-27</fecha>
   <total>125.50</total>
   <lineas>
     <linea><desc>Tornillos</desc><cant>2</cant><precio>3.5</precio></linea>
     <linea><desc>Masilla</desc><cant>1</cant><precio>6.95</precio></linea>
   </lineas>
</factura>')),
('María López', xmlparse(document
'<factura id="F002">
   <fecha>2025-10-28</fecha>
   <total>75.20</total>
   <lineas>
     <linea><desc>Guantes</desc><cant>3</cant><precio>2.20</precio></linea>
   </lineas>
</factura>'));
