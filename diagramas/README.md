# Diagrama Entidad-Relación – Pezoneras DB

Este documento explica el **modelo Entidad-Relación** del proyecto *Pezoneras DB* y las decisiones tomadas al momento de diseñarlo.

El modelo está basado en una situación real: la producción y venta particular de pezoneras de silicona, con un volumen bajo de operaciones y pocos productos involucrados.

## Contexto del negocio

El funcionamiento del negocio es simple:
- Se compra silicona como materia prima.
- Con esa silicona se fabrican pezoneras.
- Las pezoneras se venden a un grupo reducido de clientes.
- La compra de materia prima se realiza a un único proveedor.

Debido a esta simplicidad, el foco del modelo está puesto en la **gestión de compras y ventas**, y no en el proceso de fabricación.

## Reglas de negocio principales

- Cada cliente y proveedor pertenece a una única localidad.
- Se pueden realizar varias ventas a un mismo cliente.
- Se pueden realizar varias compras a un mismo proveedor.
- Cada compra y cada venta corresponden a un único producto.
- Se utiliza una sola entidad Producto para representar tanto la materia prima como el producto terminado.
- Cada venta puede generar una única factura.
