#using scripts\shared\aat_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\system_shared;

#insert scripts\shared\aat_zm.gsh;
#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#insert scripts\zm\_zm_aat_template.gsh;

#insert scripts\zm\_zm_utility.gsh;

#namespace zm_aat_template;

REGISTER_SYSTEM( ZM_AAT_TEMPLATE_NAME, &__init__, undefined )

function __init__()
{
	if ( !IS_TRUE( level.aat_in_use ) )
	{
		return;
	}
	
	//Variables in order
	//AAT Name
	//AAT Localized String
	//Feedback Icon

	aat::register( ZM_AAT_TEMPLATE_NAME,
	ZM_AAT_TEMPLATE_LOCALIZED_STRING,
	ZM_AAT_TEMPLATE_ICON );
	
	clientfield::register( "actor", ZM_AAT_TEMPLATE_CF_NAME_ZAP, VERSION_SHIP, 1, "int", &zm_aat_template_zap, !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );
	clientfield::register( "vehicle", ZM_AAT_TEMPLATE_CF_NAME_ZAP_VEH, VERSION_SHIP, 1, "int", &zm_aat_template_zap_vehicle, !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );
}

// self == targeted zombie
function zm_aat_template_zap( localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump )
{
	IPrintLnBold("zombie has been affected by custom AAT");
}

// self == targeted vehicle
function zm_aat_template_zap_vehicle( localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump )
{
	IPrintLnBold("vehicle entity has been affected by custom AAT");
}

