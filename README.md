# Sui Move Token (Objetos) - Proyecto personalizado para Jazmin Dominguez

Este repositorio contiene un **ejemplo de módulo Move para Sui** donde cada token es un **objeto único** (ideal cuando los requerimientos piden *objetos*).

Contenido:
- `Move.toml` - metadatos del paquete. Ajusta `my_addr` antes de publicar.
- `sources/my_token.move` - módulo Move con:
  - `mint(ctx, name, value)` → crea un objeto `MyToken` y lo transfiere al creador.
  - `transfer_token(token, recipient)` → transfiere un objeto a otra dirección.
  - `get_value(&token)` → devuelve el valor interno del token.

---

## Personalización hecha
He personalizado el módulo y el README con tu nombre: **Jazmin Dominguez**. Si quieres que el código incluya tu dirección por defecto (`my_addr`) o un símbolo, dímelo y lo actualizo.

---

## Cómo usar (Sui Devnet) — pasos rápidos

1. Instala Sui CLI:
```bash
curl -fsSL https://install.sui.io | sh
```

2. Crea/usa una cuenta y solicita fondos del faucet:
```bash
sui client new-address ed25519
# copia la dirección que te devuelva y:
sui client faucet
```

3. Ajusta `Move.toml`:
- Reemplaza la dirección `my_addr = "0x0"` por tu dirección (por ejemplo `my_addr = "0x1234..."`) si quieres compilar y publicar el paquete con named address.

4. Build y publish:
```bash
sui move build
sui client publish --path . --gas-budget 10000
```
Anota el `package ID` que devuelve la publicación.

5. Mint (crear) un objeto token:
```bash
sui client call   --package <PACKAGE_ID>   --module my_token   --function mint   --args "Mi Token Especial" 100   --gas-budget 10000
```

6. Lista objetos de tu cuenta:
```bash
sui client objects
```

7. Transferir un objeto (usa el object ID que obtuviste):
```bash
sui client call   --package <PACKAGE_ID>   --module my_token   --function transfer_token   --args <OBJECT_ID> <DIRECCION_DESTINO>   --gas-budget 10000
```

---

## Notas importantes

- El ejemplo está pensado para **Sui** (modelo de objetos). Si quieres que el token sea compatible con Aptos u otra cadena Move, te hago la variante.
- Algunos paths de imports (`sui::object`, `sui::tx_context`, etc.) dependen de la versión de Sui; si al compilar hay errores, dime la versión del Sui CLI que usas y lo adapto.
- Si quieres que incluya metadatos (imagen, URI) para cada objeto (estilo NFT), puedo añadir campos y lógica para almacenar/referenciarlos.

---

## Archivos incluidos
- `Move.toml`
- `sources/my_token.move`
- `README.md`
- `.gitignore`
- `LICENSE` (MIT)

Si quieres que además añada:
- scripts bash para publicar automáticamente,
- tests de Move,
- o una carpeta `docs/` con capturas y comandos listos,
dímelo y lo incluyo.

¡Listo para subir a GitHub! 🎉
