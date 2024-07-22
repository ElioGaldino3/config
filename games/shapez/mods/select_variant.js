// @ts-nocheck
const METADATA = {
    website: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    author: "emanresu",
    name: "Select Variant",
    version: "1",
    id: "select_variant",
    description: "Adds keybindings to select variants",
    minimumGameVersion: ">=1.5.0",
};

class Mod extends shapez.Mod {
    init() {
        for (let i = 1; i < 11; i++) {
            this.modInterface.registerIngameKeybinding({
                id: "select_variant_" + i,
                keyCode: shapez.keyToKeyCode((i % 10).toString()),
                translation: `Select the ${i}${["st", "nd", "rd"][i - 1] || "th"} variant of a building`,
                modifiers: {
                    alt: true,
                },
                handler: root => {
                    const metaBuilding = root.hud.parts.buildingPlacer.currentMetaBuilding.get();
                    if (!metaBuilding) {
                        root.hud.parts.buildingPlacer.currentVariant.set(defaultBuildingVariant);
                    } else {
                        const availableVariants = metaBuilding.getAvailableVariants(root);
                        if (availableVariants.length > i - 1) {
                            const newVariant = availableVariants[i - 1];
                            root.hud.parts.buildingPlacer.setVariant(newVariant);
                        }
                    }
                    return shapez.STOP_PROPAGATION;
                },
            });
        }
    }
}
