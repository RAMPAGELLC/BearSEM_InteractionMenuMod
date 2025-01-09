# BearSEM_InteractionMenuMod
Modification of SEM_InteractionMenu. Small modification event for toggling Fire &amp; LEO Toolbox based on Bear Duty status.

# Installation
* Clone https://github.com/Sc0ttM/SEM_InteractionMenu.
* Update ``SEM_InteractionMenu`` to set ``LEOAccess`` and ``FireAccess`` to ``4`` for "Ace permissions".
* Edit the `server_mod.lua` file for your departments & their relative on-duty permissions.
* Drag the `server_mod.lua` file into ``SEM_InteractionMenu``.
* Re-name `SEM_InteractionMenu` to `BearSEM_InteractionMenuMod` to avoid BearDuty erroring out.
* Edit fxmanifest.lua to add `server_mod.lua` to the `server_scripts` section.
