module main_;
import commonImports;

import network_	.network_;
import ship_	.ship_mgr_;
import logic_world_	.world_;

import loose_.sleep_ : sleep;
import core.time;

void main() {
	auto network	= new NetworkMaster	;
	auto world	= new World	;
	auto shipMgr	= new ShipMgr(world/*Implicitly cast to FlatWorld*/, 100)	;
	
	while (true) {
		sleep(100.msecs);
		auto newNetworks	= network	.getNewNetworks()	;
		auto newPlayerShips	= world	.update(newNetworks.length)	;
		shipMgr		.update(newNetworks, newPlayerShips)	;
	}
}

