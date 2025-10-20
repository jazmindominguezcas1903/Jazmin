module sui_bootcamp::nft_collection {
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext};
    use sui_bootcamp::basic_nft;
    use std::vector;

    struct Collection has key {
        id: UID,
        name: vector<u8>,
        nfts: vector<basic_nft::BasicNFT>,
    }

    public entry fun create_collection(ctx: &mut TxContext, name: vector<u8>): Collection {
        let id = object::new(ctx);
        Collection { id, name, nfts: vector::empty<basic_nft::BasicNFT>() }
    }

    public entry fun add_nft(collection: &mut Collection, nft: basic_nft::BasicNFT) {
        vector::push_back(&mut collection.nfts, nft);
    }

    public fun count(collection: &Collection): u64 {
        vector::length(&collection.nfts)
    }
}
