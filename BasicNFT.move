module sui_bootcamp::basic_nft {
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext};
    use std::vector;

    struct BasicNFT has key, store {
        id: UID,
        name: vector<u8>,
        url: vector<u8>,
    }

    public entry fun mint(ctx: &mut TxContext, name: vector<u8>, url: vector<u8>): BasicNFT {
        let id = object::new(ctx);
        BasicNFT { id, name, url }
    }

    public fun get_name(nft: &BasicNFT): vector<u8> {
        nft.name
    }
}
