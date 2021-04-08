#using scripts\codescripts\struct;

#using scripts\shared\aat_shared;
#using scripts\shared\array_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\math_shared;
#using scripts\shared\system_shared;
#using scripts\shared\util_shared;
#using scripts\shared\ai\systems\gib;

#insert scripts\shared\aat_zm.gsh;
#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#using scripts\zm\_zm_lightning_chain;
#using scripts\zm\_zm_utility;

#using scripts\shared\ai\zombie_utility;

#insert scripts\zm\_zm_aat_template.gsh;

#insert scripts\zm\_zm_utility.gsh;

#precache( "material", ZM_AAT_TEMPLATE_DAMAGE_FEEDBACK_ICON );

#namespace zm_aat_template;

REGISTER_SYSTEM( ZM_AAT_TEMPLATE_NAME, &__init__, "aat" )

function __init__()
{
	if ( !IS_TRUE( level.aat_in_use ) )
	{
		return;
	}

	//variables in order
	//AAT Name, Percentage chance of happening
	//Cooldown time Entity, Cooldown time for User
	//Global cooldown time, Occurs on Death(yes or no)
	//result function, damage feedback icon
	//damage feedback sound, validation function

	aat::register( ZM_AAT_TEMPLATE_NAME, ZM_AAT_TEMPLATE_PERCENTAGE, 
		ZM_AAT_TEMPLATE_COOLDOWN_ENTITY, ZM_AAT_TEMPLATE_COOLDOWN_ATTACKER,
		ZM_AAT_TEMPLATE_COOLDOWN_GLOBAL, ZM_AAT_TEMPLATE_OCCURS_ON_DEATH,
		&result, ZM_AAT_TEMPLATE_DAMAGE_FEEDBACK_ICON,
		ZM_AAT_TEMPLATE_DAMAGE_FEEDBACK_SOUND, &aat_validation_function );

	clientfield::register( "actor", ZM_AAT_TEMPLATE_CF_NAME_ZAP, VERSION_SHIP, 1, "int" ); 
	clientfield::register( "vehicle", ZM_AAT_TEMPLATE_CF_NAME_ZAP_VEH, VERSION_SHIP, 1, "int" );

}

function aat_validation_function()
{
	return true;
}

function result( death, attacker, mod, weapon )
{
	IPrintLnBold("Custom AAT has been triggered");
}

