#include "server.h"
#include "native_object.h"
#include "lua_api/l_internal.h"

//Sean Ferguson

//6-14
void nativeObjectRef::n_remove(ServerActiveObject *sao) {
    sao->clearChildAttachments();
    sao->clearParentAttachment();

    verbosestream << "ObjectRef::n_remove(): id=" << sao->getId() << std::endl;
    sao->markForRemoval();
}

v3f nativeObjectRef::n_get_pos(ServerActiveObject *sao) {
    return sao->getBasePosition() / BS;
}

void nativeObjectRef::n_set_pos(ServerActiveObject *sao, const v3f &pos) {
    sao->setPos(pos);
}

void nativeObjectRef::n_move_to(ServerActiveObject *sao, const v3f &pos, bool continuous) {
    sao->moveTo(pos, continuous);
}

//6-17
float nativeObjectRef::n_punch(ServerActiveObject *sao, ServerActiveObject *puncher, float time_from_last_punch, const ToolCapabilities &toolcap, const v3f &dir) {
    dir.normalize();
    u16 src_original_hp = sao->getHP();
    u16 dst_origin_hp = puncher->getHP();

    u16 wear = sao->punch(dir, &toolcap, puncher, time_from_last_punch);

    // If the punched is a player, and its HP changed
    if (src_original_hp != sao->getHP() && sao->getType() == ACTIVEOBJECT_TYPE_PLAYER) {
        getServer(L)->SendPlayerHPOrDie((PlayerSAO *)sao, PlayerHPChangeReason(PlayerHPChangeReason::PLAYER_PUNCH, puncher));
    }

    // If the puncher is a player, and its HP changed
    if (dst_origin_hp != puncher->getHP() && puncher->getType() == ACTIVEOBJECT_TYPE_PLAYER) {
        getServer(L)->SendPlayerHPOrDie((PlayerSAO *)puncher, PlayerHPChangeReason(PlayerHPChangeReason::PLAYER_PUNCH, sao));
    }

    return wear;
}

//Might not be changable
void nativeObjectRef::n_right_click(ServerActiveObject *sao, ServerActiveObject *sao2) {
    sao->rightClick(sao2);
}

void nativeObjectRef::n_set_hp(ServerActiveObject *sao, int hp, const PlayerHPChangeReason& reason) {
    sao->setHP(hp, reason);
    if (sao->getType() == ACTIVEOBJECT_TYPE_PLAYER)
        getServer(L)->SendPlayerHPOrDie((PlayerSAO *)sao, reason);
    if (reason.hasLuaReference())
        luaL_unref(L, LUA_REGISTRYINDEX, reason.lua_reference);
}

int nativeObjectRef::n_get_hp(ServerActiveObject *sao) {
    if (sao == nullptr) {
        // Default hp is 1
        return 1;
    }

    return sao->getHP();
}

InvRef nativeObjectRef::n_get_inventory(ServerActiveObject *sao)
{
	InventoryLocation loc = sao->getInventoryLocation();
	if (getServerInventoryMgr(sao->getEnv())->getInventory(loc) != nullptr)
		return InvRef::create(sao->getEnv(), loc);
	else
		return InvRef();
}