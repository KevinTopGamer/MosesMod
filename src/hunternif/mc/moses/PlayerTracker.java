package hunternif.mc.moses;

import net.minecraft.entity.player.EntityPlayer;
import cpw.mods.fml.common.IPlayerTracker;

public class PlayerTracker implements IPlayerTracker {

	@Override
	public void onPlayerLogin(EntityPlayer player) {
	}

	@Override
	public void onPlayerLogout(EntityPlayer player) {
		if (!player.worldObj.isRemote) {
			MosesMod.mosesBlockProvider.restoreAllOwnedBlocksAndPlaySound(player.worldObj, player.entityId);
		}
	}

	@Override
	public void onPlayerChangedDimension(EntityPlayer player) {
	}

	@Override
	public void onPlayerRespawn(EntityPlayer player) {
	}

}
