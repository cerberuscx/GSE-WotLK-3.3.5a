-- GSE Sample Macros for WoW 3.3.5a
-- These are example sequences for different classes to help users get started
-- To use: Copy the sequence structure and modify for your needs

local GSE = GSE
local L = GSE.L
local Statics = GSE.Static

-- Sample sequences organized by class
Statics.DocumentedSampleMacros = {}

-- WARRIOR (Class ID: 1)
Statics.DocumentedSampleMacros[1] = {
    ["Arms_SingleTarget"] = {
        Author = "GSE Team",
        SpecID = 1, -- Arms
        Talents = "2/5/3/2/1/3/3",
        Default = 1,
        Icon = "Ability_Warrior_SavageBlow",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/cast [stance:2] Berserker Stance; [stance:1] Battle Stance",
                },
                "/cast Rend",
                "/cast Mortal Strike",
                "/cast Overpower",
                "/cast Execute",
                "/cast Slam",
                "/cast Heroic Strike",
                KeyRelease = {
                },
            },
        },
    },
    ["Protection_TankRotation"] = {
        Author = "GSE Team",
        SpecID = 3, -- Protection
        Talents = "3/3/5/2/1/3/0",
        Default = 1,
        Icon = "Ability_Warrior_DefensiveStance",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/cast [nostance:2] Defensive Stance",
                },
                "/cast Shield Slam",
                "/cast Revenge",
                "/cast Devastate",
                "/cast Thunder Clap",
                "/cast Shield Block",
                "/cast Heroic Strike",
                KeyRelease = {
                },
            },
        },
    },
}

-- PALADIN (Class ID: 2)
Statics.DocumentedSampleMacros[2] = {
    ["Retribution_DPS"] = {
        Author = "GSE Team",
        SpecID = 3, -- Retribution
        Talents = "2/5/3/2/1/3/3",
        Default = 1,
        Icon = "Spell_Holy_AuraOfLight",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                },
                "/cast Judgement of Light",
                "/cast Crusader Strike",
                "/cast Divine Storm",
                "/cast Consecration",
                "/cast Exorcism",
                "/cast Hammer of Wrath",
                KeyRelease = {
                },
            },
        },
    },
    ["Holy_Healing"] = {
        Author = "GSE Team",
        SpecID = 1, -- Holy
        Talents = "5/5/0/1/3/2/0",
        Default = 1,
        Icon = "Spell_Holy_HolyBolt",
        MacroVersions = {
            [1] = {
                StepFunction = "Priority",
                KeyPress = {
                    "/target [@mouseover,help,nodead] [@target,help,nodead] [@player]",
                },
                "/cast Holy Shock",
                "/cast Flash of Light",
                "/cast Holy Light",
                "/cast Word of Glory",
                KeyRelease = {
                },
            },
        },
    },
}

-- HUNTER (Class ID: 3)
Statics.DocumentedSampleMacros[3] = {
    ["BeastMastery_DPS"] = {
        Author = "GSE Team",
        SpecID = 1, -- Beast Mastery
        Talents = "5/2/2/1/3/1/1",
        Default = 1,
        Icon = "Ability_Hunter_BeastCall",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/petattack [@target,harm]",
                    "/cast Hunter's Mark",
                },
                "/cast Kill Command",
                "/cast Serpent Sting",
                "/cast Arcane Shot",
                "/cast Steady Shot",
                "/cast Kill Shot",
                "/cast Bestial Wrath",
                KeyRelease = {
                    "/cast [@pet,dead] Revive Pet",
                },
            },
        },
    },
    ["Marksmanship_DPS"] = {
        Author = "GSE Team",
        SpecID = 2, -- Marksmanship
        Talents = "2/3/3/2/1/3/1",
        Default = 1,
        Icon = "Ability_Marksmanship",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/cast Hunter's Mark",
                },
                "/cast Serpent Sting",
                "/cast Chimera Shot",
                "/cast Aimed Shot",
                "/cast Arcane Shot",
                "/cast Steady Shot",
                "/cast Kill Shot",
                KeyRelease = {
                },
            },
        },
    },
}

-- ROGUE (Class ID: 4)
Statics.DocumentedSampleMacros[4] = {
    ["Combat_DPS"] = {
        Author = "GSE Team",
        SpecID = 2, -- Combat
        Talents = "2/3/5/2/1/3/0",
        Default = 1,
        Icon = "Ability_BackStab",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/cast [nostealth] Stealth",
                },
                "/cast Sinister Strike",
                "/cast Slice and Dice",
                "/cast Eviscerate",
                "/cast Adrenaline Rush",
                "/cast Blade Flurry",
                KeyRelease = {
                },
            },
        },
    },
    ["Assassination_DPS"] = {
        Author = "GSE Team",
        SpecID = 1, -- Assassination
        Talents = "5/2/0/3/3/1/1",
        Default = 1,
        Icon = "Ability_Rogue_Eviscerate",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/cast [nostealth] Stealth",
                },
                "/cast Mutilate",
                "/cast Slice and Dice",
                "/cast Rupture",
                "/cast Envenom",
                "/cast Cold Blood",
                KeyRelease = {
                },
            },
        },
    },
}

-- PRIEST (Class ID: 5)
Statics.DocumentedSampleMacros[5] = {
    ["Shadow_DPS"] = {
        Author = "GSE Team",
        SpecID = 3, -- Shadow
        Talents = "0/3/5/2/1/5/0",
        Default = 1,
        Icon = "Spell_Shadow_ShadowWordPain",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/cast [noform:1] Shadowform",
                },
                "/cast Vampiric Touch",
                "/cast Shadow Word: Pain",
                "/cast Devouring Plague",
                "/cast Mind Blast",
                "/cast Mind Flay",
                "/cast Shadow Word: Death",
                KeyRelease = {
                },
            },
        },
    },
    ["Holy_Healing"] = {
        Author = "GSE Team",
        SpecID = 2, -- Holy
        Talents = "2/5/5/0/3/0/0",
        Default = 1,
        Icon = "Spell_Holy_GuardianSpirit",
        MacroVersions = {
            [1] = {
                StepFunction = "Priority",
                KeyPress = {
                    "/target [@mouseover,help,nodead] [@target,help,nodead] [@player]",
                },
                "/cast Renew",
                "/cast Circle of Healing",
                "/cast Flash Heal",
                "/cast Greater Heal",
                "/cast Prayer of Mending",
                KeyRelease = {
                },
            },
        },
    },
}

-- DEATH KNIGHT (Class ID: 6)
Statics.DocumentedSampleMacros[6] = {
    ["Frost_DPS"] = {
        Author = "GSE Team",
        SpecID = 2, -- Frost
        Talents = "2/3/5/2/1/3/0",
        Default = 1,
        Icon = "Spell_Frost_FrostNova",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/cast [nopet] Raise Dead",
                },
                "/cast Icy Touch",
                "/cast Plague Strike",
                "/cast Obliterate",
                "/cast Blood Strike",
                "/cast Frost Strike",
                "/cast Howling Blast",
                KeyRelease = {
                },
            },
        },
    },
    ["Blood_Tank"] = {
        Author = "GSE Team",
        SpecID = 1, -- Blood
        Talents = "5/3/2/2/1/2/0",
        Default = 1,
        Icon = "Spell_Deathknight_BloodPresence",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/cast [nostance:1] Blood Presence",
                },
                "/cast Icy Touch",
                "/cast Plague Strike",
                "/cast Death Strike",
                "/cast Heart Strike",
                "/cast Rune Strike",
                "/cast Death and Decay",
                KeyRelease = {
                },
            },
        },
    },
}

-- SHAMAN (Class ID: 7)
Statics.DocumentedSampleMacros[7] = {
    ["Elemental_DPS"] = {
        Author = "GSE Team",
        SpecID = 1, -- Elemental
        Talents = "5/3/0/2/1/3/2",
        Default = 1,
        Icon = "Spell_Nature_Lightning",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                },
                "/cast Flame Shock",
                "/cast Lava Burst",
                "/cast Lightning Bolt",
                "/cast Earth Shock",
                "/cast Chain Lightning",
                "/cast Elemental Mastery",
                KeyRelease = {
                },
            },
        },
    },
    ["Enhancement_DPS"] = {
        Author = "GSE Team",
        SpecID = 2, -- Enhancement
        Talents = "2/5/3/3/1/2/0",
        Default = 1,
        Icon = "Spell_Nature_LightningShield",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                },
                "/cast Stormstrike",
                "/cast Flame Shock",
                "/cast Earth Shock",
                "/cast Lava Lash",
                "/cast Fire Nova",
                "/cast Lightning Bolt",
                KeyRelease = {
                },
            },
        },
    },
}

-- MAGE (Class ID: 8)
Statics.DocumentedSampleMacros[8] = {
    ["Frost_DPS"] = {
        Author = "GSE Team",
        SpecID = 3, -- Frost
        Talents = "2/3/3/3/1/5/0",
        Default = 1,
        Icon = "Spell_Frost_FrostBolt02",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                },
                "/cast Frostbolt",
                "/cast Ice Lance",
                "/cast Deep Freeze",
                "/cast Frostfire Bolt",
                "/cast Icy Veins",
                "/cast Cold Snap",
                KeyRelease = {
                },
            },
        },
    },
    ["Fire_DPS"] = {
        Author = "GSE Team",
        SpecID = 2, -- Fire
        Talents = "2/5/3/0/3/2/1",
        Default = 1,
        Icon = "Spell_Fire_FireBolt02",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                },
                "/cast Living Bomb",
                "/cast Fireball",
                "/cast Fire Blast",
                "/cast Scorch",
                "/cast Pyroblast",
                "/cast Combustion",
                KeyRelease = {
                },
            },
        },
    },
}

-- WARLOCK (Class ID: 9)
Statics.DocumentedSampleMacros[9] = {
    ["Affliction_DPS"] = {
        Author = "GSE Team",
        SpecID = 1, -- Affliction
        Talents = "5/2/2/3/1/2/0",
        Default = 1,
        Icon = "Spell_Shadow_DeathCoil",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/petattack",
                },
                "/cast Corruption",
                "/cast Unstable Affliction",
                "/cast Curse of Agony",
                "/cast Haunt",
                "/cast Shadow Bolt",
                "/cast Drain Soul",
                KeyRelease = {
                },
            },
        },
    },
    ["Destruction_DPS"] = {
        Author = "GSE Team",
        SpecID = 3, -- Destruction
        Talents = "0/3/5/2/1/5/0",
        Default = 1,
        Icon = "Spell_Shadow_RainOfFire",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/petattack",
                },
                "/cast Immolate",
                "/cast Conflagrate",
                "/cast Chaos Bolt",
                "/cast Incinerate",
                "/cast Soul Fire",
                KeyRelease = {
                },
            },
        },
    },
}

-- DRUID (Class ID: 11)
Statics.DocumentedSampleMacros[11] = {
    ["Balance_DPS"] = {
        Author = "GSE Team",
        SpecID = 1, -- Balance
        Talents = "5/3/0/2/3/1/2",
        Default = 1,
        Icon = "Spell_Nature_StarFall",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/cast [noform:5] Moonkin Form",
                },
                "/cast Insect Swarm",
                "/cast Moonfire",
                "/cast Wrath",
                "/cast Starfire",
                "/cast Starfall",
                "/cast Force of Nature",
                KeyRelease = {
                },
            },
        },
    },
    ["Feral_Cat_DPS"] = {
        Author = "GSE Team",
        SpecID = 2, -- Feral
        Talents = "0/5/5/2/3/1/0",
        Default = 1,
        Icon = "Ability_Druid_CatForm",
        MacroVersions = {
            [1] = {
                StepFunction = "Sequential",
                KeyPress = {
                    "/startattack",
                    "/cast [noform:3] Cat Form",
                },
                "/cast Savage Roar",
                "/cast Rake",
                "/cast Mangle (Cat)",
                "/cast Shred",
                "/cast Rip",
                "/cast Ferocious Bite",
                KeyRelease = {
                },
            },
        },
    },
    ["Restoration_Healing"] = {
        Author = "GSE Team",
        SpecID = 3, -- Restoration
        Talents = "2/0/3/3/5/2/1",
        Default = 1,
        Icon = "Spell_Nature_Rejuvenation",
        MacroVersions = {
            [1] = {
                StepFunction = "Priority",
                KeyPress = {
                    "/target [@mouseover,help,nodead] [@target,help,nodead] [@player]",
                },
                "/cast Rejuvenation",
                "/cast Wild Growth",
                "/cast Swiftmend",
                "/cast Regrowth",
                "/cast Nourish",
                "/cast Lifebloom",
                KeyRelease = {
                },
            },
        },
    },
}

-- Function to add these sample macros to the library
function GSE.LoadDocumentedSampleMacros()
    local currentClassID = GSE.GetCurrentClassID()
    
    -- Add samples for the current class if they exist
    if Statics.DocumentedSampleMacros[currentClassID] then
        for sequenceName, sequence in pairs(Statics.DocumentedSampleMacros[currentClassID]) do
            -- Check if sequence already exists
            if GSE.isEmpty(GSELibrary[currentClassID]) then
                GSELibrary[currentClassID] = {}
            end
            
            if GSE.isEmpty(GSELibrary[currentClassID][sequenceName]) then
                -- Add the sample sequence
                GSELibrary[currentClassID][sequenceName] = sequence
                GSE.Print("Sample macro added: " .. sequenceName, "GSE")
            end
        end
    end
end

-- Add a slash command to load sample macros
SLASH_GSELOADSAMPLES1 = "/gse loadsamples"
SlashCmdList["GSELOADSAMPLES"] = function()
    GSE.LoadDocumentedSampleMacros()
    GSE.Print("Sample macros for your class have been loaded. Type /gse to view them.", "GSE")
end