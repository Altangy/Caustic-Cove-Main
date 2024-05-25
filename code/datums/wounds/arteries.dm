/datum/wound/artery
	name = "severed artery"
	check_name = "<span class='artery'><B>ARTERY</B></span>"
	whp = 50
	sewn_whp = 20
	bleed_rate = 20
	sewn_bleed_rate = 0.2
	clotting_threshold = null
	sewn_clotting_threshold = null
	woundpain = 50
	sewn_woundpain = 20
	mob_overlay = "s1"
	sewn_overlay = "cut"
	can_sew = TRUE
	sleep_healing = 0
	embed_chance = 75

/datum/wound/artery/on_mob_gain(mob/living/affected)
	. = ..()
	affected.emote("paincrit", TRUE)
	affected.Slowdown(20)
	shake_camera(affected, 2, 2)

/datum/wound/artery/on_bodypart_gain(obj/item/bodypart/affected)
	. = ..()
	affected.temporary_crit_paralysis()

/datum/wound/artery/chest
	name = "aortic dissection"
	check_name = "<span class='artery'><B>AORTA</B></span>"
	whp = 100
	sewn_whp = 35
	bleed_rate = 50
	sewn_bleed_rate = 0.8
	woundpain = 100
	sewn_woundpain = 50

/datum/wound/artery/chest/on_mob_gain(mob/living/affected)
	. = ..()
	if(iscarbon(affected))
		var/mob/living/carbon/carbon_affected = affected
		carbon_affected.vomit(blood = TRUE)
	if(HAS_TRAIT(affected, RTRAIT_CRITICAL_WEAKNESS))
		affected.death()

/datum/wound/artery/chest/on_life()
	. = ..()
	if(!iscarbon(owner))
		return
	var/mob/living/carbon/carbon_owner = owner
	if(!carbon_owner.stat && prob(10))
		carbon_owner.vomit(1, blood = TRUE, stun = TRUE)

/datum/wound/artery/neck
	name = "severed carotid"
	check_name = "<span class='artery'><B>CAROTID</B></span>"
	whp = 100
	sewn_whp = 25
	bleed_rate = 50
	sewn_bleed_rate = 0.5
	woundpain = 60
	sewn_woundpain = 30
	mob_overlay = "s1_throat"

/datum/wound/artery/neck/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_GARGLE_SPEECH, "[type]")

/datum/wound/artery/neck/on_mob_gain(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_GARGLE_SPEECH, "[type]")
