# MyToken - Gestión de Tokens Únicos en Sui

Este proyecto es un módulo **Move** para la blockchain **Sui** que permite crear, gestionar y transferir tokens como objetos únicos. Cada token es un objeto independiente, ideal para NFTs, coleccionables, ítems de juegos o certificados digitales.

---

## Propósito

- **Representar activos digitales únicos**: Cada token tiene un `ID`, un `name` y un `value`, garantizando que sea irrepetible.  
- **Transferencia segura en blockchain**: Cada token se transfiere como objeto individual, evitando errores en balances y asegurando propiedad única.  
- **Emitir y rastrear eventos**: La creación de cada token genera un evento `TokenCreated`, permitiendo interfaces reactivas y seguimiento de actividad.  
- **Personalización de tokens**: Crea tokens con valores específicos como poder, rareza o puntuación.  
- **Base para aplicaciones complejas**: Juegos on-chain, finanzas descentralizadas y plataformas de certificación o educación.

---

## Ejemplo de uso práctico

Imagina un juego de cartas coleccionables en blockchain:

1. Cada carta es un `MyToken` (objeto único).  
2. Cada carta tiene un `name` (ej. "Dragon de Fuego") y un `value` (ej. 100 de poder).  
3. Los jugadores pueden transferir cartas entre cuentas sin duplicarlas.  
4. Se pueden listar todos los objetos de un jugador y mostrar su colección.

---

## Instalación / Uso

1. Clona el repositorio:
```bash
git clone https://github.com/tu-usuario/mi-proyecto.git
