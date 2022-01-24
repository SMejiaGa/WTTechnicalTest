# WTTechnicalTest
# Prueba tecnica de Sebastian Mejía García

## Implementaciones

| Requerimientos | Estado |
|--|--|
| - 4 vistas: Login, Productos, Contacto, Perfil | OK |
| 1) Login por usuario y contraseña | OK |
| 2) Login con redes sociales | Opcional (No implementado) |
| 3) Vista de productos usando API | OK |
| 4) Conexion con PUSH con Firebase | OK |
| 5) Manejo de base de datos local | No implementado |
| 6) Trancisión de datos entre vistas | OK |
| 7) Diseño limpio y funcional | OK |
| 8) Google Maps con API | OK |
| 8.5) Descargar Log | No implementado |
| 9) Cargar imagenes desde galeria/ guardar firma | No implementado |
| 10) Compilacion y firmado | No Desarrollado |
| 11) Codigo en Swift +4 | OK (Swift 5) |
| 12) Buenas practicas | OK |
| 13) Entregar repo por GitHub | OK |
| 14) Implementar patron diferente a MVC Y MVP| OK (MVVM) |
| 15) Vistas reusables por XIB | OK |
| 16) Filtro en listado de productos | No implementado |
| 17) Cocoapods | OK (Alamofire, Google Maps) |

## Arquitectura

Se utiliza MVVM.

**Ejemplo de la jerarquia del proyecto:**

- -Modules
- - - Products
- - - - Webservice
- - - - - ProductService.swift
- - - - ViewModel
- - - - - ProductsViewModel.swift
- - - - View
- - - - - CustomCells
- - - - - ProductsViewController.swift
- - - - -  ProductsViewController.XIB

## Capturas de pantalla
### Firebase PUSH 
![WhatsApp Image 2022-01-24 at 1 05 16 AM](https://user-images.githubusercontent.com/67339434/150732535-f6cf08db-a01d-4ac0-b12e-3758a66dfc8d.jpeg)
### Login View
![WhatsApp Image 2022-01-24 at 1 05 43 AM](https://user-images.githubusercontent.com/67339434/150732532-b10d5dad-766e-4e59-948c-2c960f1eb41f.jpeg)
### Product View
![WhatsApp Image 2022-01-24 at 1 05 58 AM](https://user-images.githubusercontent.com/67339434/150732531-1d6e8052-2404-4e96-8cfb-b6f14ff03b8a.jpeg)
### Contact View / Google Maps
![WhatsApp Image 2022-01-24 at 1 06 13 AM](https://user-images.githubusercontent.com/67339434/150732530-25bb3e40-1369-4bb3-bde8-73620ae98b4c.jpeg)
### User Profile View
![WhatsApp Image 2022-01-24 at 1 25 00 AM](https://user-images.githubusercontent.com/67339434/150732527-c4fa3501-b83a-4d26-90cd-685b47beeb38.jpeg)
