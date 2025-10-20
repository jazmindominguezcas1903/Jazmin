module my_addr::my_token {
    use sui::object;
    use sui::tx_context::{self, TxContext};
    use sui::transfer;
    use sui::event;
    use std::string::String;

    /// Estructura que representa cada token como un objeto único en Sui.
    /// Personalizado para el proyecto de Jazmin Dominguez.
    struct MyToken has key, store {
        id: object::UID,
        name: String,
        value: u64,
    }

    /// Evento emitido cuando se crea un token.
    struct TokenCreated has copy, drop {
        name: String,
        value: u64,
    }

    /// Crea (mint) un nuevo objeto MyToken.
    /// El token se crea y se transfiere al remitente (owner).
    public entry fun mint(ctx: &mut TxContext, name: String, value: u64) {
        let token = MyToken {
            id: object::new(ctx),
            name,
            value,
        };

        event::emit(TokenCreated {
            name: token.name.clone(),
            value: token.value,
        });

        // transfer::transfer mueve el objeto al remitente (owner) del ctx
        transfer::transfer(token, tx_context::sender(ctx));
    }

    /// Transfiere un token (objeto) a otra dirección.
    /// El primer argumento debe ser el objeto MyToken (lo consumes) y el segundo la dirección destino.
    public entry fun transfer_token(token: MyToken, recipient: address) {
        transfer::transfer(token, recipient);
    }

    /// Lee el valor de un token (no consume).
    public fun get_value(token: &MyToken): u64 {
        token.value
    }
}
