module sui_bootcamp::minter_role {
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext};
    use std::vector;
    use sui::address;

    struct Minter has key {
        id: UID,
        admins: vector<address>,
    }

    public entry fun init(ctx: &mut TxContext, admin: address): Minter {
        let id = object::new(ctx);
        Minter { id, admins: vector::singleton(admin) }
    }

    public fun is_admin(m: &Minter, a: address): bool {
        let len = vector::length(&m.admins);
        let mut i = 0;
        while (i < len) {
            if vector::borrow(&m.admins, i) == &a {
                return true;
            }
            i = i + 1;
        }
        false
    }
}
